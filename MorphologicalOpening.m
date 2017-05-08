% Video describing this process can be found here: https://www.youtube.com/watch?v=LlzuycEnSvM
function [ OutputPhoto ] = MorphologicalOpening( InputPhoto, PixelThreshold )
    OutputPhoto = bwareaopen(InputPhoto, PixelThreshold);
end

