function newFIS = newOutput(oldFIS, num, name)
%adds a variable and its membership functions to the FIS for an input
newFIS = oldFIS;

newFIS = addvar(newFIS, 'output', name, [0, 1]);
newFIS = addmf(newFIS, 'output', num, 'unlikely', 'trimf', [0 0 1]);
newFIS = addmf(newFIS, 'output', num, 'likely', 'trimf', [0 1 1]);