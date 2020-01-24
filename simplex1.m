function[] = simplex()

% 	MaxoMin = input('Is this a max or min problem');
    
    Csmall = input('Enter the coefficients for the Objective Function: ');
	A = input('Enter the coefficients for all constraints: ');
	RightHandSide = input('Enter the values for the RHS: ');
	basis =(size(Csmall,2) + 1) : (size(Csmall,2) + size(A,1));
	SlackVariables = zeros(1,size(A,1));
	Row0 = [Csmall,SlackVariables];
    Row0 = Row0*-1;
	I = eye(size(A,1));
	RHS = RightHandSide;
	AI = [A , I , RightHandSide];
    
	B = AI(:,basis(1));
	for i = 2: size(A,1)
    	B2 = AI(:,basis(i));
    	B = [B , B2];
	end
    
	inverseB = inv(B);
	Cb = zeros(1,size(A,1));
    
	for i = 1:size(A,1)
    	Cb(i) = Row0(basis(i));
	end
    
	Row0L = Cb * inverseB * A - Csmall; %#ok<MINV>
	Row0R = Cb * inverseB;
	Zvalue = Cb * inverseB * RightHandSide;
	Row0Final = [Row0L,Row0R,Zvalue];
   
	Tableau = [Row0Final ; AI];
	disp(Tableau);
    
	[LowestPosition, LowestNumber] = Find_Lowest(Row0Final);
	if LowestNumber < 0
    	KickedBasis = Find_Kicked_Basis(RightHandSide,AI,LowestPosition);
    	basis(KickedBasis) = LowestPosition;
   	 
    	SimplexIteration(basis, A, Row0, AI, Csmall, RightHandSide, RHS);
	end
end
	 
function[LowestPosition,LowestNumber] = Find_Lowest(Row0)
	LowestNumber = Row0(1);
	LowestPosition = 1;
	for i = 2 : size(Row0,2)
    	if Row0(i)<LowestNumber
        	LowestNumber = Row0(i);
        	LowestPosition = i;
    	end
	end
end

function[KickedBasis] = Find_Kicked_Basis(RHS, AI, LowestPosition)
	Ratios = RHS./ AI(:,LowestPosition);
%    [minimum,KickedBasis]=min(Ratios(Ratios>0));
	if Ratios(1) > 0
    	SmallestRatio = Ratios(1);
    	KickedBasis = 1;
	else
    	SmallestRatio = Ratios(2);
    	KickedBasis = 2;
	end
	for i = 2:size(Ratios,1)
    	if Ratios(i)<SmallestRatio && Ratios(i) > 0
        	SmallestRatio = Ratios(i);
        	KickedBasis = i;
    	end
	end
end

function[] = SimplexIteration(basis, A, Row0, AI, Csmall, RightHandSide, RHS)
	for i = 1:size(A,1)
    	Cb(i) = Row0(basis(i)); %#ok<SAGROW>
	end

	B = AI(:,basis(1));
	for i = 2: size(A,1)
    	B2 = AI(:,basis(i));
    	B = [B , B2];
	end
    
	inverseB = inv(B);
    
	AL = inverseB * A;
	I = inverseB;
	RHS = inverseB * RightHandSide;
	AIR = [AL,I,RHS];


    
	Row0L = Cb * inverseB * A - Csmall; %#ok<MINV>
	Row0R = Cb * inverseB;
	Zvalue = Cb * inverseB * RightHandSide;
	Row0Final = [Row0L,Row0R,Zvalue];
    
	Tableau = [Row0Final ; AIR];
	disp(Tableau);
    
    
	[LowestPosition, LowestNumber] = Find_Lowest(Row0Final);
	if LowestNumber < 0
    	KickedBasis = Find_Kicked_Basis(RHS,AI,LowestPosition);
    	basis(KickedBasis) = LowestPosition;
   	 
    	SimplexIteration(basis, A, Row0, AI, Csmall, RightHandSide, RHS);
	else
    	fprintf('This is the Optimal Tableau!');
	end
end
