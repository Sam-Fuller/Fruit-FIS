%the fuzzy inference system
FruitFIS = newfis('Fruit');



%INPUTS

%input 1
%Colour input, on a scale of 0-360, red being 0 and 360 progressing through
%red -> orange -> yellow -> green -> blue -> purple -> red
FruitFIS = addvar(FruitFIS, 'input', 'Colour (Degrees)', [0 360]);

%membership functions
FruitFIS = addmf(FruitFIS, 'input', 1, 'red 1', 'gaussmf', [10 0]);
FruitFIS = addmf(FruitFIS, 'input', 1, 'orange', 'gaussmf', [10 30]);
FruitFIS = addmf(FruitFIS, 'input', 1, 'yellow', 'gaussmf', [10 60]);
FruitFIS = addmf(FruitFIS, 'input', 1, 'green', 'gaussmf', [30 120]);
FruitFIS = addmf(FruitFIS, 'input', 1, 'blue', 'gaussmf', [30 210]);
FruitFIS = addmf(FruitFIS, 'input', 1, 'purple', 'gaussmf', [20 285]);
FruitFIS = addmf(FruitFIS, 'input', 1, 'red 2', 'gaussmf', [15 360]);

%input 2
%Size input, only accepting fruits between 1 and 20 cm
%very small -> small -> medium -> large
FruitFIS = addvar(FruitFIS, 'input', 'Size (cm)', [1 13]);

%membership functions
FruitFIS = addmf(FruitFIS, 'input', 2, 'very small', 'gaussmf', [1 1]);
FruitFIS = addmf(FruitFIS, 'input', 2, 'small', 'gaussmf', [1 4]);
FruitFIS = addmf(FruitFIS, 'input', 2, 'medium', 'gaussmf', [5 13]);

%input 3
%Hardness input, no unit, simply on a scale of 0 to 30
%very soft -> soft -> medium -> hard
FruitFIS = addvar(FruitFIS, 'input', 'Hardness', [0 20]);

%membership functions
FruitFIS = addmf(FruitFIS, 'input', 3, 'soft', 'trimf', [0 0 10]);
FruitFIS = addmf(FruitFIS, 'input', 3, 'medium', 'trimf', [0 10 20]);
FruitFIS = addmf(FruitFIS, 'input', 3, 'hard', 'trimf', [10 20 20]);

figure(1)
subplot(4,1,1), plotmf(FruitFIS,'input',1);
subplot(4,1,2), plotmf(FruitFIS,'input',2);
subplot(4,1,3), plotmf(FruitFIS,'input',3);



%OUTPUTS

FruitFIS = newOutput(FruitFIS, 1, 'Mango');
FruitFIS = newOutput(FruitFIS, 2, 'Orange');
FruitFIS = newOutput(FruitFIS, 3, 'Apple');

FruitFIS = newOutput(FruitFIS, 4, 'Kiwi');
FruitFIS = newOutput(FruitFIS, 5, 'Plum');
FruitFIS = newOutput(FruitFIS, 6, 'Apricot');

FruitFIS = newOutput(FruitFIS, 7, 'Grape');
FruitFIS = newOutput(FruitFIS, 8, 'Blueberry');
FruitFIS = newOutput(FruitFIS, 9, 'Physalis');

subplot(4,1,4), plotmf(FruitFIS, 'output',1);

%RULES

%Mango rules
%Ripe
Mango01 = [2 3 2   2 0 0  0 0 0  0 0 0   1 1];
Mango02 = [3 3 2   2 0 0  0 0 0  0 0 0   1 1];

%Unripe
Mango03 = [3 3 3   2 0 0  0 0 0  0 0 0   0.5 1];
Mango04 = [4 3 3   2 0 0  0 0 0  0 0 0   0.5 1];

%Not
%Colour
Mango07 = [1 0 0   1 0 0  0 0 0  0 0 0   1 1];
Mango08 = [5 0 0   1 0 0  0 0 0  0 0 0   1 1];
Mango09 = [6 0 0   1 0 0  0 0 0  0 0 0   1 1];

%Size
Mango10 = [0 2 0   1 0 0  0 0 0  0 0 0   1 1];
Mango11 = [0 1 0   1 0 0  0 0 0  0 0 0   1 1];

%Hardness
Mango12 = [0 0 1   1 0 0  0 0 0  0 0 0   1 1];


%Orange Rules
%Ripe
Orange01 = [2 3 1   0 2 0  0 0 0  0 0 0   1 1];

%Unripe
Orange02 = [3 3 1   0 2 0  0 0 0  0 0 0   0.75 1];
Orange03 = [4 3 2   0 2 0  0 0 0  0 0 0   0.75 1];

%Not
%Colour
Orange04 = [1 0 0   0 1 0  0 0 0  0 0 0   1 1];
Orange06 = [5 0 0   0 1 0  0 0 0  0 0 0   1 1];
Orange07 = [6 0 0   0 1 0  0 0 0  0 0 0   1 1];
Orange08 = [7 0 0   0 1 0  0 0 0  0 0 0   1 1];

%Size
Orange09 = [0 1 0   0 1 0  0 0 0  0 0 0   1 1];

%Hardness
Orange11 = [0 0 2   0 1 0  0 0 0  0 0 0   1 1];
Orange12 = [0 0 3   0 1 0  0 0 0  0 0 0   1 1];



%Apple Rules
%Ripe
Apple01 = [1 2 3   0 0 2  0 0 0  0 0 0   0.5 1];
Apple02 = [2 2 3   0 0 2  0 0 0  0 0 0   0.5 1];
Apple03 = [3 2 3   0 0 2  0 0 0  0 0 0   0.5 1];
Apple04 = [4 2 3   0 0 2  0 0 0  0 0 0   0.5 1];
Apple05 = [7 2 3   0 0 2  0 0 0  0 0 0   0.5 1];

Apple06 = [1 3 3   0 0 2  0 0 0  0 0 0   1 1];
Apple07 = [2 3 3   0 0 2  0 0 0  0 0 0   1 1];
Apple08 = [3 3 3   0 0 2  0 0 0  0 0 0   1 1];
Apple09 = [4 3 3   0 0 2  0 0 0  0 0 0   1 1];
Apple10 = [7 3 3   0 0 2  0 0 0  0 0 0   1 1];

%Overripe
Apple11 = [1 2 2   0 0 2  0 0 0  0 0 0   0.25 1];
Apple12 = [2 2 2   0 0 2  0 0 0  0 0 0   0.25 1];
Apple13 = [3 2 2   0 0 2  0 0 0  0 0 0   0.25 1];
Apple14 = [4 2 2   0 0 2  0 0 0  0 0 0   0.25 1];
Apple15 = [7 2 2   0 0 2  0 0 0  0 0 0   0.25 1];

Apple16 = [1 3 2   0 0 2  0 0 0  0 0 0   0.5 1];
Apple17 = [2 3 2   0 0 2  0 0 0  0 0 0   0.5 1];
Apple18 = [3 3 2   0 0 2  0 0 0  0 0 0   0.5 1];
Apple19 = [4 2 2   0 0 2  0 0 0  0 0 0   0.5 1];
Apple20 = [7 3 2   0 0 2  0 0 0  0 0 0   0.5 1];

%Not
%Colour
Apple21 = [5 0 0   0 0 1  0 0 0  0 0 0   1 1];
Apple22 = [6 0 0   0 0 1  0 0 0  0 0 0   1 1];

%Size
Apple23 = [0 1 0   0 0 1  0 0 0  0 0 0   1 1];

%Hardness
Apple24 = [0 0 1   0 0 1  0 0 0  0 0 0   1 1];



%Kiwi Rules
%Ripe
Kiwi01 = [4 2 2   0 0 0  2 0 0  0 0 0   1 1];

%Unripe
Kiwi02 = [4 2 3   0 0 0  2 0 0  0 0 0   0.5 1];

%Overripe
Kiwi03 = [4 2 1   0 0 0  2 0 0  0 0 0   0.5 1];

%Not
%Colour
Kiwi04 = [1 0 0   0 0 0  1 0 0  0 0 0   1 1];
Kiwi05 = [2 0 0   0 0 0  1 0 0  0 0 0   1 1];
Kiwi06 = [3 0 0   0 0 0  1 0 0  0 0 0   1 1];
Kiwi07 = [5 0 0   0 0 0  1 0 0  0 0 0   1 1];
Kiwi08 = [6 0 0   0 0 0  1 0 0  0 0 0   1 1];
Kiwi09 = [7 0 0   0 0 0  1 0 0  0 0 0   1 1];

%Size
Kiwi10 = [0 1 0   0 0 0  1 0 0  0 0 0   1 1];
Kiwi11 = [0 3 0   0 0 0  1 0 0  0 0 0   1 1];



%Plum Rules
%Ripe
Plum01  = [1 2 1   0 0 0  0 2 0  0 0 0   1 1];
Plum02  = [6 2 1   0 0 0  0 2 0  0 0 0   1 1];
Plum03  = [7 2 1   0 0 0  0 2 0  0 0 0   1 1];

Plum04  = [1 2 2   0 0 0  0 2 0  0 0 0   1 1];
Plum05  = [6 2 2   0 0 0  0 2 0  0 0 0   1 1];
Plum06  = [7 2 2   0 0 0  0 2 0  0 0 0   1 1];

%Unripe
Plum07  = [1 2 3   0 0 0  0 2 0  0 0 0   0.5 1];
Plum08  = [6 2 3   0 0 0  0 2 0  0 0 0   0.5 1];
Plum09  = [7 2 3   0 0 0  0 2 0  0 0 0   0.5 1];

Plum10  = [1 1 3   0 0 0  0 2 0  0 0 0   0.5 1];
Plum11  = [6 1 3   0 0 0  0 2 0  0 0 0   0.5 1];
Plum12  = [7 1 3   0 0 0  0 2 0  0 0 0   0.5 1];

%Not
%Colour
Plum13  = [2 0 0   0 0 0  0 1 0  0 0 0   1 1];
Plum14  = [3 0 0   0 0 0  0 1 0  0 0 0   1 1];
Plum15  = [4 0 0   0 0 0  0 1 0  0 0 0   1 1];
Plum16  = [5 0 0   0 0 0  0 1 0  0 0 0   1 1];

%Size
Plum17  = [0 3 0   0 0 0  0 1 0  0 0 0   1 1];



%Apricot Rules
%Ripe
Apricot01  = [3 2 1   0 0 0  0 0 2  0 0 0   1 1];
Apricot02  = [2 2 1   0 0 0  0 0 2  0 0 0   1 1];

%Unripe
Apricot03  = [3 2 2   0 0 0  0 0 2  0 0 0   0.5 1];
Apricot04  = [2 2 2   0 0 0  0 0 2  0 0 0   0.5 1];

Apricot05  = [3 2 3   0 0 0  0 0 2  0 0 0   0.25 1];
Apricot06  = [2 2 3   0 0 0  0 0 2  0 0 0   0.25 1];

%Not
%Colour
Apricot07  = [1 0 0   0 0 0  0 0 1  0 0 0   0.5 1];
Apricot08  = [4 0 0   0 0 0  0 0 1  0 0 0   1 1];
Apricot09  = [5 0 0   0 0 0  0 0 1  0 0 0   1 1];
Apricot10  = [6 0 0   0 0 0  0 0 1  0 0 0   1 1];
Apricot11  = [7 0 0   0 0 0  0 0 1  0 0 0   0.5 1];


%Size
Apricot12  = [0 1 0   0 0 0  0 0 1  0 0 0   1 1];
Apricot13  = [0 3 0   0 0 0  0 0 1  0 0 0   1 1];



%Grape Rules
%Ripe
Grape01 = [3 1 2   0 0 0  0 0 0  2 0 0   0.5 1];
Grape02 = [4 1 2   0 0 0  0 0 0  2 0 0   1 1];

%Not
%Colour
Grape03 = [1 0 0   0 0 0  0 0 0  1 0 0   1 1];
Grape04 = [2 0 0   0 0 0  0 0 0  1 0 0   1 1];
Grape05 = [5 0 0   0 0 0  0 0 0  1 0 0   1 1];
Grape06 = [6 0 0   0 0 0  0 0 0  1 0 0   1 1];
Grape07 = [7 0 0   0 0 0  0 0 0  1 0 0   1 1];

%Size
Grape08 = [0 2 0   0 0 0  0 0 0  1 0 0   1 1];
Grape09 = [0 3 0   0 0 0  0 0 0  1 0 0   1 1];

%Hardness
Grape10 = [0 0 1   0 0 0  0 0 0  1 0 0   0.5 1];
Grape11 = [0 0 3   0 0 0  0 0 0  1 0 0   0.5 1];



%Blueberry Rules
%Ripe
Blueberry01 = [5 1 1   0 0 0  0 0 0  0 2 0   1 1];
Blueberry02 = [6 1 1   0 0 0  0 0 0  0 2 0   1 1];

%Not
%Colour
Blueberry03 = [1 0 0   0 0 0  0 0 0  0 1 0   1 1];
Blueberry04 = [2 0 0   0 0 0  0 0 0  0 1 0   1 1];
Blueberry05 = [3 0 0   0 0 0  0 0 0  0 1 0   1 1];
Blueberry06 = [4 0 0   0 0 0  0 0 0  0 1 0   1 1];
Blueberry07 = [7 0 0   0 0 0  0 0 0  0 1 0   1 1];

%Size
Blueberry08 = [0 2 0   0 0 0  0 0 0  0 1 0   1 1];
Blueberry09 = [0 3 0   0 0 0  0 0 0  0 1 0   1 1];

%Hardness
Blueberry10 = [0 0 2   0 0 0  0 0 0  0 1 0   1 1];
Blueberry11 = [0 0 3   0 0 0  0 0 0  0 1 0   1 1];



%Physalis Rules
%Ripe
Physalis01 = [2 1 2   0 0 0  0 0 0  0 0 2   1 1];

%Unripe
Physalis02 = [3 1 2   0 0 0  0 0 0  0 0 2   0.5 1];
Physalis03 = [4 1 3   0 0 0  0 0 0  0 0 2   0.5 1];


%Not
%Colour
Physalis04 = [1 0 0   0 0 0  0 0 0  0 0 1   1 1];
Physalis05 = [5 0 0   0 0 0  0 0 0  0 0 1   1 1];
Physalis06 = [6 0 0   0 0 0  0 0 0  0 0 1   1 1];
Physalis07 = [7 0 0   0 0 0  0 0 0  0 0 1   1 1];

%Size
Physalis08 = [0 2 0   0 0 0  0 0 0  0 0 1   1 1];
Physalis09 = [0 3 0   0 0 0  0 0 0  0 0 1   1 1];

%Hardness
Physalis10 = [0 0 1   0 0 0  0 0 0  0 0 1   1 1];



RuleList = [Apple01; Apple02; Apple03; Apple04; Apple05; Apple06; Apple07; Apple08; Apple09; Apple10; Apple11; Apple12; Apple13; Apple14; Apple15; Apple16; Apple17; Apple18; Apple19; Apple20; Apple21; Apple22; Apple23; Apple24; Apricot01; Apricot02; Apricot03; Apricot04; Apricot05; Apricot06; Apricot07; Apricot08; Apricot09; Apricot10; Apricot11; Apricot12; Apricot13; Blueberry01; Blueberry02; Blueberry03; Blueberry04; Blueberry05; Blueberry06; Blueberry07; Blueberry08; Blueberry09; Blueberry10; Blueberry11; Grape01; Grape02; Grape03; Grape04; Grape05; Grape06; Grape07; Grape08; Grape09; Grape10; Grape11; Kiwi01; Kiwi02; Kiwi03; Kiwi04; Kiwi05; Kiwi06; Kiwi07; Kiwi08; Kiwi09; Kiwi10; Kiwi11; Mango01; Mango02; Mango03; Mango04; Mango07; Mango08; Mango09; Mango10; Mango11; Mango12; Orange01; Orange02; Orange03; Orange04; Orange06; Orange07; Orange08; Orange09; Orange11; Orange12; Physalis01; Physalis02; Physalis03; Physalis04; Physalis05; Physalis06; Physalis07; Physalis08; Physalis09; Physalis10; Plum01; Plum02; Plum03; Plum04; Plum05; Plum06; Plum07; Plum08; Plum09; Plum10; Plum11; Plum12; Plum13; Plum14; Plum15; Plum16; Plum17];
FruitFIS = addrule(FruitFIS, RuleList);
%showrule(FruitFIS)
FruitFIS.defuzzMethod = 'bisector';
names = ["Mango"; "Orange"; "Apple"; "Kiwi"; "Plum"; "Apricot"; "Grape"; "Blueberry"; "Physalis"];



Inputs = xlsread('Inputs.xlsx');

i=1;
while (i <= size(Inputs,1))
    out = evalfis([Inputs(i, 1), Inputs(i, 2), Inputs(i, 3)], FruitFIS);
    [a,pos] = max(out);
    output = names(pos);
    fprintf('%i: Colour: %i, Size: %i, Hardness: %i, Fruit: %s\n', i, Inputs(i, 1), Inputs(i, 2), Inputs(i, 3), output);
    disp(out);
    %printf('   %i, %i, %i,  %i, %i, %i,  %i, %i, %i', 
    
    i = i + 1;
end