# URLImage

## Overview

URLImage is a package that holds an easy way of showing images from an URL.

Usually this processes should take the following process:

A View requires to a ViewController (Controller layer) on MVC, or ViewModel on MVVM, or Presenter on VIPER, then this request should pass through a service. There, this request is processed returning data that will be used to build an UIImage and finally showing in a View.

This whole process is too long if you just want to show an image on your screen. You need to build many layers to achieve that.

Hence, why not create a shortcut?

## How to use it?

URLImage is very straight foward to use.

```swift
URLImage(URL(string: "https://cdn.pixabay.com/photo/2020/12/03/14/35/horror-5800684_960_720.jpg")!)
```

Add this to your SwiftUI View and it should render as the view is presented.

Like this:

<img src="https://github.com/ramoliveira/URLImage/blob/810c7b99cebac3ad0bb6d7f66cfe987811c2676b/Sources/README%20Pics/rendered-URLImage.png" alt="Rendered URLImage" width="400"/>

But, if you want to resize your view. Use like this:

```swift
URLImage(URL(string: "https://cdn.pixabay.com/photo/2020/12/03/14/35/horror-5800684_960_720.jpg")!) { image in
    image.resizable()
}.frame(width: 200, height: 200)
```

This will create an image with 200 width and 200 height.

### There are any native option?

Yes! I started to work on this package and then realized that there is a native option build by Apple. It's called AsyncImage. However, AsyncImage is restricted to iOS 15.0 or greater.

URLImage work on later versions.
