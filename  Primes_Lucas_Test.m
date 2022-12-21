function  Primes_Lucas_Test
  %Generating primes using the Lucas test
  pkg load symbolic;
  clear;
  clc;
  syms N;

  [N, a, prime_num] = generation_prime();

  disp("N:"); disp(N);
  disp("a:"); disp(a);
  disp("p:"); disp(prime_num);

  if Lucas_test(N,a,prime_num)
    disp("It's prime number!");
  else
    disp("It's NOT a prime number!");
  end
end

%Простое: (Проверено в гугле)
% 796701680940262530694890234375000000001
% ---а: [9  11  17  9  11]
%----pr: [2  3  5  7  11]

function flag = Lucas_test(N, a, Primes)
    flag = 0;
    x = 2:round(vpa(log(N)/log(sym(2))));
    b = 2;
    for k=1:size(x,2)
      b = x(k);
      if sym(mod(power(sym(b),N-1),N))  ~= sym(1)
        break;
      end
      for m = 1:5
        if sym(mod(power(sym(b),(N-1)/sym(Primes(m))), N)) ~= sym(1)
          flag = 1;
        else
          flag = 0;
          break;
        end
      end
      if flag == 1
        break;
      end
    end
end

function  [prime, a, start_prime] = generation_prime()
  down = sym('2^123');
  up = sym('2^128');

  prime_list = sym(primes(128)); %2 3 5 7 11 13 17 19 23 29 31 ...113 127
  %Далее:
  %Выбор простых p1,p2,...p5 (Я просто беру первые пять из списка_
  %и их степеней a1,a2..a5 (Вначале они все равны 1)
  a = sym(ones(1,5));%now: 1 1 1 1 1
  start_prime = sym(prime_list([1:5])); % 2 3 5 7 11
  n = sym(prod(start_prime)); % n = 2*3*5*7*11 = 2310

  %Формирование n в границах: down < n < up
  while n < down
    %на каждой итерации одну СЛУЧАЙНУЮ степень из а1,..а5 увеличиваю на 2
    index = randi([1,5]);
    a(index) += 2;
    tmp_prime = start_prime.^a;
    %в n записываю произведение: a1^p1*a2^p2*..a5^p5
    n = prod(tmp_prime);
  end
  %Для таких маленьких простых, после выполнения предыдущего цикла
  %ещё ни разу не появлялось число большее up
  %потом доработаю процесс "опускания" если вдруг такое произошло
  if n > up
    %disp('Yes 1');
  end
  %На выходе: число на единицу большее, чем n
  %Его и будет проверять тест Люка на простоту
  prime = n + 1;
  end
