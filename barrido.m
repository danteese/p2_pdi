function [t, linear_sweep, space_sweep] = barrido( fi, ff, m )
% Function that generates a sine sweep from fi to ff at m samples.
% Params: 
%   fi - initial frequency in h
%   ff - end frequency in h
%   m - number of samples
% Returns: 
%   linear_sweep - the sweep in timeline
%   space_sweep - Mesh the time into a bidimensional matrix and returns its
%   sweep.

    % Idea from: https://www.edn.com/electronics-news/4384064/Generate-a-Swept-Sine-Test-Signal

    sampling = (ff - fi)/m; % Assuming normalized freq
    t = fi: sampling: (ff-sampling); % Times per cycle
    a = t.^2; % a factor
    linear_sweep = sin(a);
    
    % Bidimensional sweeping
    [X,Y] = meshgrid(t);
    space = sqrt(X.^2 + Y.^2);
    space_sweep = sin(space .^ 2);

    
end

