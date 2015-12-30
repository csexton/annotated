# Annotated for Captured

The Annotate Image code from [Captured](http://www.capturedapp.com/).

Right now this is a stand alone app that invokes the annotate window. There is a wrapper class, `Annotator`, that wraps opening the nib, passing in the file and editing it in place.

Eventually this would be great as a stand alone framework, but the project has not been re-worked to support that. The plan is to support distribution via [Carthage](https://github.com/Carthage/Carthage), but that is complicated by the fact that this contains resources such as images and nib files.


# License

This code is distributed under the MIT License. See '`LICENSE.md`](LICENSE.md) for details.
