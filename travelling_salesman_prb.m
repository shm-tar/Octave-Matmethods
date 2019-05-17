shliah = [];
H = 0;

A = [NaN, 7, 10, 20, 11;
     6, NaN, 6, 14, 4;
     5, 20, NaN, 18, 15;
     16, 4, 7, NaN, 11;
     7, 3, 2, 8, NaN]

n = size(A, 1);

for kr = 1:n

printf("krok %i\n", kr)

m_row = min(A, [], 2) %1 - min znachennia v kolonci, 2 - v riadku

for i = 1:n
  if isnan(m_row(i)) 
    m_row(i) = 0
  endif
endfor

A = A - m_row %redukcia po riadkah

m_col = min(A, [], 1)

for i = 1:n
  if isnan(m_col(i))
    m_col(i) = 0
  endif
endfor

A = A - m_col %redukcia po kolonkah

H = H + sum(m_row) + sum(m_col) %rozrahunok mezhi

#poshuk max constanti privedennia dlia 0vix elementiv
max_const_priv = -1;
pos_i = 0;
pos_j = 0;

for i = 1:n 
 for j = 1:n
   tmp_m1 = 100;
   tmp_m2 = 100;
   if A(i,j) == 0
     for k = 1:n
       if(A(i,k)>=0) && (A(i,k) < tmp_m1) && k!=j 
         tmp_m1 = A(i,k); %poshuk min u riadkah
       endif
       if(A(k,j)>=0) && (A(k,j) < tmp_m2) && k!=i
         tmp_m2 = A(k,j); %poshuk min u kolonkah
       endif
     endfor
     placeholder = tmp_m1 + tmp_m2; %suma konstant privedennia
     if(placeholder > max_const_priv) 
            max_const_priv = placeholder;
            pos_i = i;
            pos_j = j;
         endif
      endif
   endfor
endfor

max_const_priv

#stavimo NaN na misce max_const_priv
A(pos_j, pos_i) = NaN;

shliah = [shliah, [pos_i pos_j]];

%zmenshuyemo rozmiry matryci
for i = 1:n
  A(pos_i, i) = NaN;
  A(i, pos_j) = NaN;
endfor
shliah
endfor
