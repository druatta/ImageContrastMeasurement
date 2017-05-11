function MeanGrayIntensity = ComputeMeanGrayIntensity(PixelCount, GreyIntensityLevels)
MeanGrayIntensity = sum(PixelCount .* GreyIntensityLevels) / sum(PixelCount);

end

