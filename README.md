# mo806 - UNICAMP 2020/2

### Esse repositório contém o código utilizado para realização de testes no escalonador Linux utilizando perf. 

O arquivo myhb.c contém uma adaptação do [hackbench](http://manpages.ubuntu.com/manpages/xenial/man8/hackbench.8.html) para a realização de testes do escalonador Linux.

O arquivo run-tests.sh realiza alguns testes para coleta os dados da aplicação utilizando perf. 
(WARNING: O comando perf sched gera arquivos muito grandes, cuidado ao rodar o script!)

