
# give-star-reviews

A package for giving reviews for the things

<img src="https://github.com/buraktabn/give-star-reviews/raw/master/images/img0.gif" width="200" />

## Getting Started

```yaml
dependencies:
  givestarreviews: ^1.0.2
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
    GiveStarData(text: 'Review 2', onChanged: null),
    GiveStarData(text: 'Review 3', starCount: 3, onChanged: (rate) {}),
 ],
),
```
Single
```dart
StarRating(onChanged: (rate) {}),
```

To make a read only `StarRating`, simply set the `onChanged` to null or leave empty. 

## Contributions

Contributions of any kind are more than welcome! Feel free to fork and improve in any way you want, make a pull request, or open an issue.
