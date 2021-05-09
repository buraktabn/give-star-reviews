
# give-star-reviews

A package for giving reviews for the things

<img src="https://github.com/buraktabn/give-star-reviews/raw/master/images/img0.gif" width="200" />

## Getting Started

```yaml
dependencies:
  givestarreviews: ^1.0.1
```

```console
$  flutter pub get
```

```dart
import  'package:givestarreviews/givestarreviews.dart';
```

## Example

Multiple
```dart
GiveStarReviews(
  starData: [
    GiveStarData(text: 'Review 1', onChanged: (rate) {}),
    GiveStarData(text: 'Review 2', onChanged: (rate) {}),
    GiveStarData(text: 'Review 3', onChanged: (rate) {}),
 ],
),
```
Single
```dart
StarRating(onChanged: (rate) {}),
```

## Contributions

Contributions of any kind are more than welcome! Feel free to fork and improve in any way you want, make a pull request, or open an issue.
