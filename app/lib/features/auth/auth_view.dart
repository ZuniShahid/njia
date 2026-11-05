// Prototype `authView()`: dark left panel with the pitch, form on the right with tabs
// "Sign in" / "Create account". Methods: email + password and Google (the Firebase project has
// these two enabled; phone sign-in is not enabled, so the prototype's Phone/Email toggle is left out).
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/links.dart';
import '../../app/providers.dart';
import '../../app/shell.dart';
import '../../app/theme.dart';
import '../../data/auth_service.dart';
import '../../data/user_repository.dart';
import '../../shared/widgets/ui.dart';

enum _Tab { signIn, create }

class AuthView extends ConsumerStatefulWidget {
  const AuthView({super.key});

  @override
  ConsumerState<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends ConsumerState<AuthView> {
  _Tab _tab = _Tab.signIn;
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _terms = false;
  bool _busy = false;
  String? _error;
  String? _info;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _run(Future<AuthUser> Function() action) async {
    setState(() {
      _busy = true;
      _error = null;
      _info = null;
    });
    try {
      final user = await action();
      await ref.read(userRepositoryProvider).ensureProfile(AuthLike(uid: user.uid, email: user.email, displayName: user.displayName));
      if (!mounted) return;
      toast(context, 'Signed in as ${user.displayName ?? user.email ?? ''}'.trimRight());
    } on AuthFailure catch (e) {
      setState(() => _error = e.message);
    } catch (e) {
      setState(() => _error = 'Something went wrong. Try again.');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _submit() {
    if (!_form.currentState!.validate()) return;
    if (_tab == _Tab.create && !_terms) {
      setState(() => _error = 'Please agree to the terms and privacy notice.');
      return;
    }
    final auth = ref.read(authServiceProvider);
    _run(() => _tab == _Tab.signIn
        ? auth.signInWithEmail(_email.text, _password.text)
        : auth.createAccount(name: _name.text, email: _email.text, password: _password.text));
  }

  Future<void> _forgot() async {
    final email = _email.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      setState(() => _error = 'Enter your email first, then tap "Forgot password?".');
      return;
    }
    try {
      await ref.read(authServiceProvider).sendPasswordReset(email);
      setState(() {
        _error = null;
        _info = 'We sent a reset link to $email.';
      });
    } on AuthFailure catch (e) {
      setState(() => _error = e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, c) {
          final narrow = c.maxWidth <= NjiaTokens.narrow;
          final left = _Pitch(narrow: narrow);
          final form = _buildForm(context);
          if (narrow) {
            return ListView(children: [left, Padding(padding: const EdgeInsets.fromLTRB(16, 40, 16, 40), child: Center(child: form))]);
          }
          return Row(
            children: [
              Expanded(child: left),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40), child: form),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final t = context.tokens;
    final create = _tab == _Tab.create;
    return SizedBox(
      width: 400,
      child: Form(
        key: _form,
        child: AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Tabs(tab: _tab, onChanged: (v) => setState(() {
                    _tab = v;
                    _error = null;
                    _info = null;
                  })),
              const SizedBox(height: 16),
              Text(create ? 'Create your account' : 'Welcome back', style: text.titleLarge),
              const SizedBox(height: 16),
              if (create) ...[
                Field(
                  label: 'Full name',
                  child: TextFormField(
                    controller: _name,
                    autofillHints: const [AutofillHints.name],
                    textCapitalization: TextCapitalization.words,
                    validator: (v) => (v == null || v.trim().length < 2) ? 'Enter your name.' : null,
                  ),
                ),
                const SizedBox(height: 16),
              ],
              Field(
                label: 'Email',
                child: TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  validator: (v) => (v == null || !v.contains('@')) ? 'Enter a valid email.' : null,
                ),
              ),
              const SizedBox(height: 16),
              Field(
                label: 'Password',
                child: TextFormField(
                  controller: _password,
                  obscureText: true,
                  autofillHints: [create ? AutofillHints.newPassword : AutofillHints.password],
                  onFieldSubmitted: (_) => _submit(),
                  validator: (v) => (v == null || v.length < (create ? 8 : 1)) ? (create ? 'Use at least 8 characters.' : 'Enter your password.') : null,
                ),
              ),
              if (create) ...[
                const SizedBox(height: 12),
                InkWell(
                  onTap: () => setState(() => _terms = !_terms),
                  child: Row(
                    children: [
                      Checkbox(value: _terms, onChanged: (v) => setState(() => _terms = v ?? false), visualDensity: VisualDensity.compact),
                      const Expanded(child: Text('I agree to the terms and privacy notice', style: TextStyle(fontSize: 12))),
                      TextButton(onPressed: openPrivacyPolicy, child: const Text('Read', style: TextStyle(fontSize: 12))),
                    ],
                  ),
                ),
              ],
              if (_error != null) ...[
                const SizedBox(height: 12),
                Text(_error!, style: TextStyle(fontSize: 12, color: t.bad), key: const Key('auth-error')),
              ],
              if (_info != null) ...[
                const SizedBox(height: 12),
                Text(_info!, style: text.bodySmall),
              ],
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _busy ? null : _submit,
                child: Text(create ? 'Create account' : 'Sign in'),
              ),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: _busy ? null : () => _run(ref.read(authServiceProvider).signInWithGoogle),
                icon: const Icon(Icons.g_mobiledata_rounded, size: 22),
                label: const Text('Continue with Google'),
              ),
              if (!create) ...[
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: _busy ? null : _forgot,
                    style: TextButton.styleFrom(padding: EdgeInsets.zero, textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                    child: const Text('Forgot password?'),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({required this.tab, required this.onChanged});
  final _Tab tab;
  final ValueChanged<_Tab> onChanged;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    Widget item(_Tab v, String label) {
      final on = v == tab;
      return InkWell(
        onTap: () => onChanged(v),
        child: Container(
          padding: const EdgeInsets.fromLTRB(2, 10, 2, 9),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: on ? t.brand : Colors.transparent, width: 2))),
          child: Text(label, style: TextStyle(fontWeight: on ? FontWeight.w600 : FontWeight.w400, color: on ? t.brand : t.muted)),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: t.line))),
      child: Row(children: [item(_Tab.signIn, 'Sign in'), const SizedBox(width: 22), item(_Tab.create, 'Create account')]),
    );
  }
}

/// `.auth-l`: dark panel with logo, headline, three steps.
class _Pitch extends StatelessWidget {
  const _Pitch({required this.narrow});
  final bool narrow;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    const steps = [
      ('Tell us your dream job', 'Anywhere in Europe'),
      ('Get a step-by-step roadmap', 'With costs, visas and deadlines'),
      ('Tick off the next milestone', 'With tutors and mentors'),
    ];
    return Container(
      color: t.nav,
      padding: narrow ? const EdgeInsets.fromLTRB(16, 28, 16, 28) : const EdgeInsets.all(48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [const NjiaMark(), const SizedBox(width: 10), Text('Njia', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: t.navInk))]),
          SizedBox(height: narrow ? 20 : 32),
          Text(
            'Plan the path to the job you want.',
            style: TextStyle(fontSize: narrow ? 26 : 34, height: 1.15, fontWeight: FontWeight.w700, color: t.navInk),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: Text('A roadmap, checklists and funding ideas for students in Sierra Leone. Up to five goals.',
                style: TextStyle(fontSize: 14, color: t.navMuted)),
          ),
          if (!narrow) ...[
            const SizedBox(height: 32),
            for (final (i, (title, sub)) in steps.indexed)
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 26,
                      height: 26,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: t.nav2, shape: BoxShape.circle),
                      child: Text('${i + 1}', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: t.accent)),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: TextStyle(fontWeight: FontWeight.w700, color: t.navInk)),
                        Text(sub, style: TextStyle(fontSize: 12, color: t.navMuted)),
                      ],
                    ),
                  ],
                ),
              ),
            const Spacer(),
            Text('Your data is stored in the EU.', style: TextStyle(fontSize: 12, color: t.navMuted)),
          ],
        ],
      ),
    );
  }
}
