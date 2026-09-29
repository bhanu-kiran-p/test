function definiteness = checkDefiniteness(matrix)
    eigenvalues = eig(matrix);
    if all(eigenvalues>0)
        definiteness = 'Positive Definite';
    elseif all(eigenvalues>=0)
        definiteness = 'Positive Semi Definite';
    elseif all(eigenvalues<0)
        definiteness = 'Negative Definite';
    elseif all(eigenvalues<=0)
        definiteness = 'Negative Semi Definite';
    else
        definiteness = 'indefinite';
    end
end
