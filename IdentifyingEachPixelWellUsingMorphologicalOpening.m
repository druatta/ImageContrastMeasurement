close all

CameraPhoto = ReadImageFromWorkspace('11V200ns.jpg');
figure('Name', 'Original Photo');
DisplayImage(CameraPhoto);

figure('Name','Photo After Histogram Equalization')
PhotoAfterHistogramEqualization = HistogramEqualization(CameraPhoto);
DisplayImage(PhotoAfterHistogramEqualization);

figure('Name','Photo After Histogram Equalization then Locally Adaptive Thresholding')
PhotoAfterLocallyAdaptiveThresholding = imbinarize(PhotoAfterHistogramEqualization, 'adaptive');
DisplayImage(PhotoAfterLocallyAdaptiveThresholding);

figure('Name','Photo After Histogram Equalization then Locally Adaptive Thresholding then a 3x3 Averaging Filter')
PhotoAfter_3x3_AveragingFilter = filter2(fspecial('average',3), PhotoAfterLocallyAdaptiveThresholding);
DisplayImage(PhotoAfter_3x3_AveragingFilter);

figure('Name','Photo After Histogram Equalization then Locally Adaptive Thresholding then a 3x3 Averaging Filter then Morphological Opening using squares')
MorphologicalOpeningSquareThreshold = strel('square',21);
PhotoAfterSquareMorphologicalOpening = imopen(PhotoAfter_3x3_AveragingFilter,MorphologicalOpeningSquareThreshold);
DisplayImage(PhotoAfterSquareMorphologicalOpening)

figure('Name','Photo After Histogram Equalization then Locally Adaptive Thresholding then a 3x3 Averaging Filter then Morphological Opening using rectangles')
MorphologicalOpeningRectangularThreshold = strel('rectangle',[5 25]);
PhotoAfterRectangularMorphologicalOpening = imopen(PhotoAfter_3x3_AveragingFilter,MorphologicalOpeningRectangularThreshold);
DisplayImage(PhotoAfterRectangularMorphologicalOpening);

% figure('Name','','Photo After Histogram Equalization then Locally Adaptive Thresholding then a 3x3 Averaging Filter then Morphological Opening using disks')
% MorphologicalOpeningDiskThreshold = strel('disk',25);
% PhotoAfterDiskMorphologicalOpening = imopen(PhotoAfter_3x3_AveragingFilter,MorphologicalOpeningRectangularThreshold);
% DisplayImage(PhotoAfterDiskMorphologicalOpening);

figure('Name','Labeled Photo After Histogram Equalization then Locally Adaptive Thresholding then a 3x3 Averaging Filter then Morphological Opening using rectangles')
Iregion = regionprops(PhotoAfterSquareMorphologicalOpening,'centroid');
[LabeledObjects,NumberOfObjects] = bwlabel(PhotoAfterSquareMorphologicalOpening,4);
stats = regionprops(LabeledObjects,'Eccentricity','Area','BoundingBox');
eccentricities = [stats.Eccentricity];
IndexOfObjects = find(eccentricities);
statsDefects = stats(IndexOfObjects);
DisplayImage(PhotoAfterSquareMorphologicalOpening);

hold on;
for i = 1 : length(IndexOfObjects)
    h = rectangle('Position',statsDefects(i).BoundingBox,'LineWidth',2);
    set(h,'EdgeColor',[0.5 0 0]);
    hold on;
end
if i > 10
    title(['There are ', num2str(NumberOfObjects), ' objects in the image!']);
end
hold off;