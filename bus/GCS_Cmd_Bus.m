function cellInfo = GCS_Cmd_Bus(varargin) 
% GCS_CMD_BUS returns a cell array containing bus object information 
% 
% Optional Input: 'false' will suppress a call to Simulink.Bus.cellToObject 
%                 when the MATLAB file is executed. 
% The order of bus element attributes is as follows:
%   ElementName, Dimensions, DataType, SampleTime, Complexity, SamplingMode, DimensionsMode, Min, Max, DocUnits, Description 

suppressObject = false; 
if nargin == 1 && islogical(varargin{1}) && varargin{1} == false 
    suppressObject = true; 
elseif nargin > 1 
    error('Invalid input argument(s) encountered'); 
end 

cellInfo = { ... 
  { ... 
    'GCS_Cmd_Bus', ... 
    '', ... 
    '', ... 
    'Auto', ... 
    '-1', {... 
{'timestamp', 1, 'uint32', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'mode', 1, 'uint32', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'cmd_1', 1, 'uint32', -1, 'real', 'Sample', 'Fixed', [], [], '', sprintf('Operation channel 1')}; ...
{'cmd_2', 1, 'uint32', -1, 'real', 'Sample', 'Fixed', [], [], '', sprintf('Operation channel 2')}; ...
    } ...
  } ...
}'; 

if ~suppressObject 
    % Create bus objects in the MATLAB base workspace 
    Simulink.Bus.cellToObject(cellInfo) 
end 
