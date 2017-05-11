CameraPhoto = ReadImageFromWorkspace('[0.8,21].bmp');

[PixelCount GreyIntensityLevels] = CreateHistogram(CameraPhoto);
MeanGrayIntensity = ComputeMeanGrayIntensity(PixelCount, GreyIntensityLevels)