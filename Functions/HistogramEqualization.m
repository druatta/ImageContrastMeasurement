function [ PhotoAfterHistogramEqualization ] = RunHistogramEqualization( OriginalPhoto )
    PhotoAfterHistogramEqualization = histeq(OriginalPhoto);
end

