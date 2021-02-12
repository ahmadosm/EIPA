% Ahmad Osman
% 101070948
% PA5 Code

nx = 50;
ny = 50;
G = sparse(nx*ny,nx*ny); % creates a 3D sparse matrix holding three variables

for k = 1:nx
    for j = 1:ny
        n = j + (k-1)*ny;
        
        if k == 1 || k == nx ||j == 1 || j == ny
            G(n, :) = 0;
            G(n, n) = 1;
        else
            G(n, n) = -4;
            G(n, n+1) = 1;
            G(n, n-1) = 1;
            G(n, n+ny) = 1;
            G(n, n-ny) = 1;
        end
    end
end
figure(1) 
spy(G)
[E, D] = eigs(G, 9, 'SM'); % Randomly gets 9 eigen vectors and values 
                           % and put them in the matrices E and D
                           % respectively.

newE = zeros(nx, ny, 9);
figure(2)

for m = 1:9
   newE(:, :, m) = reshape(E(:, m), nx, ny);
   subplot(3, 3, m)
   surf(newE(:, :, m))% Surf function used for remapping matrix
end