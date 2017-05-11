function [PixelCount GreyLevels] = CreateHistogram( Image )

[PixelCount GreyLevels] = imhist(Image);

end

