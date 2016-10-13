% returns an adaptive FIR filter System object,
% HLMS, that computes the filtered output, filter error and the filter
% weights for a given input and desired signal using the Least Mean
% Squares (LMS) algorithm.

%   Copyright 2011-2015 The MathWorks, Inc.

clear('mlhdlc_lms_fcn');

hfilt2 = dsp.FIRFilter(...
        'Numerator', fir1(10, [.5, .75]));
rng('default'); % always default to known state  
x = randn(1000,1);                              % Noise
d = step(hfilt2, x) + sin(0:.05:49.95)';         % Noise + Signal

stepSize = 0.01;
reset_weights =false;

hSrc = dsp.SignalSource(x);
hDesiredSrc = dsp.SignalSource(d);

hOut = dsp.SignalSink;
hErr = dsp.SignalSink;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Call to the design
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while (~isDone(hSrc))
    [y, e] = mlhdlc_lms_fcn(step(hSrc), step(hDesiredSrc), stepSize, reset_weights);
    step(hOut, y);
    step(hErr, e);
end

figure('Name', [mfilename, '_signal_plot']);
subplot(2,1,1), plot(hOut.Buffer), title('Noise + Signal');
subplot(2,1,2),plot(hErr.Buffer), title('Signal');








