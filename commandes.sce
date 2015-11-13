// Mini stage Scilab/LaTeX
// Guyot - Lefoulon

// Question 1
// help spec
id = eye(3, 3)

// -----------
// Question 2
// -----------
A = [
  1, 0, 3, 1
  1, 2, 0, 1
  0, 1, 3, 0
]

size(A)


first_line = A(1,:)
last_col = A(:,$)
l2_c3 = A(2, 3)


diago = diag(A) 
trian_sup = triu(A)
trian_inf = tril(A)

// -----------
// Question 3
// -----------
J = ones(10, 10)
id = diag(diag(J))
id_sup = diag(diag(J, 1), 1)
id_inf = diag(diag(J, -1), -1)


d = id .* 2
d_sup =  id_sup .* -1
C = d + d_sup + id_inf


c = zeros(1, 10)
c(1) = 2
c(2) = 1
r = zeros(1, 10)
r(1) = 2
r(2) = -1
C = toeplitz(c, r)

// -----------
// Question 4
// -----------
x = linspace(0, 2*%pi, 6)
y = linspace(0, 2*%pi, 21)
plot(x, sin(x), 'b', y, sin(y), 'r')
xtitle('Graphe de la fonction sinus')
legend('n = 6', 'n = 21')

n = 50
x = linspace(0, 2*%pi, n)
subplot(2, 2, 1)
plot(x, sin(x))
xtitle('sin')

x = linspace(-10, 10, n)
subplot(2, 2, 2)
plot(x, exp(x))
xtitle('exp')

subplot(2, 2, 3)
plot(x, x.^2 .* (x-1))
xtitle('x^2 * (x-1)')

subplot(2, 2, 4)
plot(x, (x+1)./(x.^2+1))
xtitle('(x+1)/(x^2+1)')

// -----------
// Exercice 3
// -----------
// 1.
function In = I(n)
  if n = 0 then
    In = exp(1) - 1
  else
    In = exp(1) - n * I(n-1)
  end
endfunction

x = I(20)

// 2.
function In = Isum(n, m)
  In = 0

  for k = 0:m
    In = In + 1/factorial(k) * 1/(1+k+n)
  end
endfunction

x = Isum(20, 1000)

// -----------
// Exercice 4
// -----------
function I = rectangle(n)
  dx = 1/(n-1)
  x = 0:dx:1
  y = x.^20 .* exp(x)

  I = 0

  for i = 1:n
    I = I + dx * y(i)
  end
endfunction

I = rectangle(10000)

// -----------
// Exercice 7
// -----------
// 2.
function lambda = lambdak(mat, k)
  lambda = 0
  n = size(mat(:,1))(1)

  for j = 1:n
    if j ~= k then  
      lambda = lambda + abs(mat(k, j))
    end
  end
endfunction

function [cx, cy, r] = dk(mat, k)
  c = mat(k, k)
  cx = real(c)
  cy = imag(c)
  r = lambdak(mat, k)
endfunction

function plot_dks(mat)
  n = size(mat(:,1))(1)
  a = linspace(0, 2*%pi, 100)

  for k = 1:n
    [cx, cy, r] = dk(mat, k)
    x = cx + r*cos(a)
    y = cy + r*sin(a)
    plot(x, y)
  end
endfunction

A = [
  1 + %i, %i, 2
  3, 2 + %i, 1
  1, %i, 6
]

clf;

plot_dks(A)
