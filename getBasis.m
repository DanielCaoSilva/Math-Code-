function newBasis = createBasis(tab,oldBasis)
    newBasis = oldBasis;
   [numRows,numCols]=size(tab);
   [~,Index]= min(tab(1,:));
   for i=1:(numRows)
       Ratio(i)=tab(i,numCols)/tab(i,Index);
   end
   [~,indexRatio]=min(Ratio(Ratio>0));
   newBasis(indexRatio) = Index;
end

        
        