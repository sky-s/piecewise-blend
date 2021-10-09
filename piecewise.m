function foo = piecewise(f0,border,f)
% PIECEWISE  Create a piecewise function handle.
% 
%   foo = PIECEWISE(f1,border,f2,border,f3,...) returns a function handle to a
%   piecewise combination of provided functions (or constants), transitioning
%   from one function to the next at the specified borders. When evaluate at the
%   border, the function will return the midway value between functions.
% 
%   Example:
%     foo = piecewise(-1,-pi/2,@sin,pi/2,1,2*pi,@cos);
%     fplot(foo,[-pi,3*pi]);
% 
%   See also blend.

% Copyright (c), Sky Sartorius. All rights reserved.
% Contact: www.mathworks.com/matlabcentral/fileexchange/authors/101715 

arguments
    f0
end
arguments (Repeating)
    border
    f
end

foo = f0;

for i = 1:numel(f)
    foo = blend(foo,f{i},border{i},eps);
end

end
