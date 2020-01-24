prompt = 'Enter your favorite day of the week, but do not forget to capitalize the first letter:';
day = input(prompt,'s');
switch day
    case {'Sunday'}
        day_number=1;
    case {'Monday'}
        day_number=2;
    case {'Tuesday'}
        day_number=3;
    case {'Wednesday'}
        day_number=4;
    case {'Thursday'}
        day_number=5;
    case {'Friday'}
        day_number=6;
    case {'Saturday'}
        day_number=7;
    otherwise
        disp('Invalid Input');
end
fprintf('The day number is %d\n',day_number);
        
    