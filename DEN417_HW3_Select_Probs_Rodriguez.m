%% HW8.2 - Curve Fitting (Quadratic - 2nd order polynomial)

% *Data*
% Declare variable to hold year data vector
Y = [1815, 1845, 1875, 1905, 1935, 1965];
% Declare variable t
t = Y - 1800; % t is the number of years after 1800, this is going to be
% the horizontal coords of the data points (independent variable)

% Decalare variable to hold population data vector
Pop = [8.3, 19.7, 44.4, 83.3, 127.1, 190.9];

% Perform a curve fit using the polyfit function, which uses the least
% squares method.
% Declare variable p which is a vector of the coefficients of the
% polynomial that fits the data (see Sec.8.2 p.267)
p = polyfit(t, Pop, 2) % 2 specifies the degree (order) of the polynomial
% leaving this unsupressed displays the vector in the command window
% the output vector are the regression coefficients of the math model

% Declare a variable to hold a vector of year data, from 1815 - 1965,
% 100 points, to be used for plotting the polynomial
tp = linspace(1815, 1965, 100);
% Declare a variable to hold a vector with values of the polynomial at each tp 
yp = polyval(p, tp-1800);

% *Plot Results*
plot(Y, Pop, 'o', tp,yp);
xlabel('Year');
ylabel('Population (Millions)');
legend('Data', 'Model');

% _*Population estimate at 19115*_
% *Value of a polynomial*
% polyval function performs a polynomial evaluation 
pop1915est = polyval(p, 1915-1800)

%% HW8.4 - Cuve Fitting
% *Knowns*
x=[1 2.2 3.7 6.4 9 11.5 14.2 17.8 20.5 23.2];
y=[12 9 6.6 5.5 7.2 9.2 9.6 8.5 6.5 2.2];

% *Plot Results*
disp('Part a')
p1=polyfit(x,y,1); % 1st order polynomial
xplot=linspace(0,24,100);
yplot=polyval(p1,xplot);
figure;
plot(x,y,'ok',xplot,yplot,'k','linewidth',2,'markersize',8)
title('Linear Fit (1st Order Polynomial)','fontsize',18)
xlabel('x','fontsize',18)
ylabel('y','fontsize',18)

disp('Part b')
p1=polyfit(x,y,2); % 2nd order polynomial
xplot=linspace(0,24,100);
yplot=polyval(p1,xplot);
figure;
plot(x,y,'ok',xplot,yplot,'k','linewidth',2,'markersize',8)
title('2nd Order Polynomial','fontsize',18)
xlabel('x','fontsize',18)
ylabel('y','fontsize',18)

%% HW8.6 - Curve Fitting and Interpolation

% *Knowns*
v=[5:10:75]; % mi/h
FE = [11 22 28 29.5 30 30 27 23]; %mpg

% *Curve fit*
xp=linspace(5,75,100);
yp=polyval(p,xp);

disp('Part c');
% Perform interpolation using the interp1 function
% see Sec 8.3 p.274
ypL=interp1(v,FE,xp,'linear'); % 'linear' is the method of interpolation
ypS=interp1(v,FE,xp,'spline');
figure;
plot(v,FE,'o',xp,ypL,':',xp,ypS)

title('Linear and Spline Interpolations','fontsize',18)
xlabel('Year')
xlabel('v (mi/h)')
ylabel('FE (mpg)')
legend('Data','Linear','Spline')
FE60L=interp1(v,FE,60,'linear');
FE60S=interp1(v,FE,60,'spline');

fprintf('Fuel Efficiency (Linear, Spline fit) = %.4f, %.4f\n',FE60L, FE60S)

%% HW6.1 - Daily Temperature in Chicago and San Francisco

% *Knowns*
% Maximum daily temp (F), August 2009
Chicago = [75 79 86	86 79 81 73 89 91 86 81 82 86 88 89	90 ...
    82 84 81 79 73 69 73 79 82 72 66 71 69 66 66];
SanFran = [69 68 70 73 72 71 69 76 85 87 74 84 76 68 79 ...
    75 68 68 73 72 79 68 68 69 71 70 89 95 90 66 69];

% *Calculations*
disp('Part a')
TavgCh = mean(Chicago);
%fprintf('The average temperature in Chicago was %4.2f \n',avgCh)%,' degF.')
TavgSF = mean(SanFran);

str = ['The average temperature in Chicago was ',num2str(TavgCh,'%.2f'),...
    char(176) 'F.'];
    % '...' known as ellipsis continues the ...
    % current command on the next line.
    % str is a statements creating a string array containing the message
    % 'num2str' is a function that converts numbers to character array
    % '%.2f' specifies precision, 2 decimal points to the right of decimal
    % the f specifies a floating point number.
    % ' a single apostrophe is start/termination character
    % the number 176 is the Unicode value that denotes the degree symbol. 
    % You can convert 176 to a character and add it to your text, by using
    % the char() function.
    
disp(str) % displays the message in the string array, creating a single...
    % character array.
    % the process of creating a string array is called concatenation
str = ['The average temperature in San Francisco was ',num2str(TavgSF,'%.2f'),...
    char(176) 'F.'];
disp(str)
% Alternative way to write formatted data to an output file.
fprintf(['The average temperature in San Francisco was %.2f', char(176),'F.\n'],TavgSF)

disp('Part b')
% Number of days the temp was above the average in each city
% (see sample problem 6-1, p. 182) 

% Declare variable to store logical array (1s and 0s) by setting it to...
% comparison statment Chicago array > TavgCh scalar.
TaboveAvgCh = Chicago > TavgCh; % The scalar is compared with every element
% of the array, the result is a logical array where a 1 is assigned for 
% every true index and a 0 for every false index.

% Next, count the number of 1s (true elements) in the logical array.
NdaysTaboveAvgCh = sum(TaboveAvgCh); %sum function sums all elements in array
str = ['The number of days where the daily temperature in Chicago exceeded the '...
    'average daily temperature was ',num2str(NdaysTaboveAvgCh,'%.0f.')];
disp(str)

TaboveAvgSF = SanFran > TavgSF;
NdaysTaboveAvgSF = sum(TaboveAvgSF);
str = ['The number of days where the daily temperature in San Francisco '...
    'exceeded the average daily temperature was ',num2str(NdaysTaboveAvgSF, '%.0f.')];
disp(str)    
  
disp('Part c')
% Number of days and which dates was SanFran < Chicago
% Declare variable to hold logical array, true when SanFran < Chicago
SFlessCh = SanFran < Chicago;
% Declare variable to hold scalar sum of days when temp in SF < Chicago
NdaysSFlessCh = sum(SFlessCh);
% Declare variable to find element index when temp in SF < Chicago,... 
% the element index is also the date of the month.
datesSFlessCh = find(SFlessCh); % returns vector containing the linear...
% indices of each nonzero element in array SFlessCh.
str = ['There was ', num2str(NdaysSFlessCh, '%.0f'), ' days when the ',...
    'temperature in San Francisco was less than Chicago and those '...
    'dates were ', num2str(datesSFlessCh, '%3.0f'),'.'];
disp(str)

disp('Part d')
% Number of days and which dates the temp was the same in both cities.
% Declare variable to hold logica array, true when SF == Ch (equal to)
SFequaltoCh = SanFran == Chicago;
NdaysSFequaltoCh = sum(SFequaltoCh);
datesSFequaltoCh = find(SFequaltoCh); %find will return vector...
% containing the linear indices of each nonzero element in the argument
% array NdaysSFequaltoCh
str = ['There was ', num2str(NdaysSFequaltoCh, '%.0f'), ' day when the '...
    'temperature in both cities was the same and the date was the ',...
    num2str(datesSFequaltoCh, '%3.0f'),'th.'];
disp(str)


%% HW6.4 - Top Scores Average

% Declare, set, and display array scores
scores = input('Enter the scores inside brackets [ ] = ')

% Declare, set, and display the top values to average
n = input('Enter the number of top scores to average ')

% Declare and set to sort scores in descending order
scoresDescending = sort(scores, 'descend'); % The descend string specifies
% the direction.
% Declare and set accumulator to hold running total.
scoresTotal = 0;
for k = 1:n
    scoresTotal = scoresDescending(k) + scoresTotal;
end
% Declare and set average variable.
avg = scoresTotal/n;
% Display the average to the user
fprintf('The average of the top %.f scores is %3.1f. \n',n,avg)
% the f is a conversion character specifying the output as a floating-point
% number, the integer after the % specifies the field width, and the number
% after the decimal place specifies the number of decimal places.
