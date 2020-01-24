function newBasis = createBasis(tab,oldBasis)
 newBasis = oldBasis;
   [numRows,numCols]=size(tab);
   newvector = tab(1,1:numCols-1);
   [~,Index]= min(newvector);
   Ratio = tab(2:numRows,numCols)./ tab(2:numRows,Index);


   Ratio(Ratio<=0) = NaN;
   [~,indexRatio]=min(Ratio);
   newBasis(indexRatio) = Index;

end

        
        