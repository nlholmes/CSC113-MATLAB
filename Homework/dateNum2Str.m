% Nathan Holmes
% October 19, 2017
% Section 208
% Homework 6
function dateNum2Str(numDate)
% Converts numeric dates to string dates
% INPUT:    numDate -- vector of the current date mm/dd/yyyy
% OUTPUT:   none    -- prints to the command window

leMonths = {'January','February','March','April','May','June','July','August','September','October','November','December'};

disMonth = leMonths{numDate(:,1)};
threeDay = numDate(:,2);
disYear = numDate(:,3);

fprintf('%s %d, %d\n',disMonth,threeDay,disYear);
end