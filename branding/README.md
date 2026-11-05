# Njia brand assets

Mark "Soft Ni" (chosen by Philipp, 5 Nov 2026): an N drawn as one path whose right stem ends in an orange dot, so it also reads as the "i" of Njia. Design canvas: https://claude.ai/artifact/1u7tniWhL6apjs9apaqo4F

| Colour | Hex | Use |
| --- | --- | --- |
| Deep petrol | `#0B4D47` | icon background, Android adaptive background |
| Cream | `#F7F2E8` | path |
| Amber | `#E8962E` | destination dot |

Files:
- `njia-mark.svg` – rounded square (Android legacy launcher, web, favicon)
- `njia-mark-square.svg` – full square, opaque (iOS App Store and Play icon; the stores round the corners)
- `njia-mark-foreground.svg` – path and dot only, for the Android adaptive icon foreground and monochrome
- `njia-mark-maskable.svg` – full bleed with safe-zone padding (PWA maskable icons)
- `play-store-icon-512.png` – Play Console app icon (512 × 512, opaque)
- `play-feature-graphic-1024x500.png` – Play Console feature graphic

The launcher icons in `app/android/.../mipmap-*`, `app/ios/.../AppIcon.appiconset` and `app/web/icons` are rendered from these SVGs.
The in-app colours (`app/lib/app/theme.dart`, brand `#0E5E57`, accent `#E08A22`) are unchanged.
