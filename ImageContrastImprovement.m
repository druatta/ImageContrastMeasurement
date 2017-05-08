close all;

CameraPhoto = ReadImageFromWorkspace('12V_400ns.png');
figure('Name', 'Original Photo');
DisplayImage(CameraPhoto);

figure('Name','Photo After Histogram Equalization')
PhotoAfterHistogramEqualization = HistogramEqualization(CameraPhoto);
DisplayImage(PhotoAfterHistogramEqualization);

figure('Name','Photo After Histogram Equalization then Otsus Method')
PhotoAfterOtsusMethod = CreateBinaryImageUsingOtsusMethod(PhotoAfterHistogramEqualization);
DisplayImage(PhotoAfterOtsusMethod);

figure('Name','Photo After Histogram Equalization then Locally Adaptive Thresholding')
PhotoAfterLocallyAdaptiveThresholding = imbinarize(PhotoAfterHistogramEqualization, 'adaptive');
DisplayImage(PhotoAfterLocallyAdaptiveThresholding)

figure('Name', 'Photo After Histogram Equalization then Otsus Method then a 3x3 Averaging Filter')
PhotoAfterOtsusMethodAnd_3x3_AveragingFilter = filter2(fspecial('average',3),PhotoAfterOtsusMethod);
DisplayImage(PhotoAfterOtsusMethodAnd_3x3_AveragingFilter);

figure('Name', 'Photo After Histogram Equalization then Contrast Stretching')
PhotoAfterContrastStretching = ContrastStretching(PhotoAfterHistogramEqualization);
DisplayImage(PhotoAfterContrastStretching);

figure('Name','Photo After Histogram Equalization then Contrast Stretching then Otsus Method')
PhotoAfterContrastStretchingAndOtsusMethod = CreateBinaryImageUsingOtsusMethod(PhotoAfterContrastStretching);
DisplayImage(PhotoAfterContrastStretchingAndOtsusMethod)

figure('Name', 'Photo After Histogram Equalization then Contrast Stretching then Otsus Method then a 3x3 Averaging Filter')
PhotoAfterContrastStretching_OtsusMethod_And3x3_AveragingFilter = filter2(fspecial('average',3), PhotoAfterContrastStretchingAndOtsusMethod);
DisplayImage(PhotoAfterContrastStretching_OtsusMethod_And3x3_AveragingFilter)

figure('Name', 'Photo After Histogram Equalization then Contrast Stretching then a 3x3 Averaging Filter')
PhotoAfter_3x3_AveragingFilter = filter2(fspecial('average',3), PhotoAfterContrastStretching) / 255;
DisplayImage(PhotoAfter_3x3_AveragingFilter)
