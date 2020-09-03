#include <iostream>
#include <fstream>
#include <iomanip>
#include <string>
#include <bitset>
#include <cstring>

using namespace std;

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <wchar.h>

int numeroBits = 16;

int mdc( int a, int b ){
  int c;
  while ( a != 0 ) {
     c = a; a = b%a;  b = c;
  }
  return b;
}
int ehCoprimo(int a, int b){
    if(mdc(a,b)==1){
        return 1;
    }else{
        return 0;
    }
}
int getRandom(){
    unsigned int r;
        r = rand() % 255 + 2;
  return r;
}
int ehPrimo(unsigned int num){
    int i, flag = 0;

    for(i=2;i<=num/2;++i){
          if(num%i == 0 ){
              flag=1;
              break;
          }
    }
      if (flag==0)
        return 1;
      else
        return 0;
}
int inverso(int e, int phi){
    int s, d = 1;

    do{
        s = (d*e)%phi;
        d++;
    }while(s!=1);

    d = d-1;
    return d;
}
int encripta(int M, int e, int n){
    int i;
    int C = 1;

    for(i=0;i < e;i++)
    C=C*M%n;

    C = C%n;

    return C;
}
int decripta(int C, int d, int n){
    int i;
    int M = 1;

    for(i=0;i < d;i++)
        M=M*C%n;

    M = M%n;

    return M;
}
void converteAscii(int n){
    char c ;
    c = static_cast<char>(n);
    cout << c;
}
int charToInt(char caractere){
    if(caractere == 48)
        return 0;
    if(caractere == 49)
        return 1;
}
char *DecToBinary(int n){
   int c, d, count;
   char *pointer;

   count = 0;
   pointer = (char*)malloc(32+1);

   if ( pointer == NULL )
      exit(EXIT_FAILURE);

   for ( c = numeroBits-1 ; c >= 0 ; c-- )
   {
      d = n >> c;

      if ( d & 1 )
         *(pointer+count) = 1 + '0';
      else
         *(pointer+count) = 0 + '0';

      count++;
   }
   *(pointer+count) = '\0';

   return  pointer;
}
int BinToInt(char *c){
    int i, pos = 0;
    int tamanho = 0;
    int numDecimal = 0;
    int algarismo;

    tamanho = 16;
    for(i=tamanho-1;i>=0;i--){
         if (charToInt(c[i]) == 1){
            algarismo = c[i] - '0';
            numDecimal+=pow(2, pos);
         }
        pos++;
    }
    return numDecimal;
}
int converteChar(char c){
	int r=0;
	r = static_cast<int>(c);
}
int main() {
    srand(time(NULL));

    fstream arquivo;


    string mensagem;

    char c=0xC0;
    char c2;
    unsigned int i = 0;
    unsigned int offset = 0;
    int LSB;

     int p,q,phi; //inteiros 'p' e 'q'
     int d,e,n,C;
     int M;
     int tam;

    cout << "DIGITE UMA MENSAGEM: ";
    getline(cin, mensagem); /* SALVA MENSAGEM DIGITADA PELO USUÁRIO ATEH DAR ENTER*/
    tam = mensagem.length();
    cout << "Numero de characteres da mensagem: "<< tam <<"\n"; /* IMPRIME A QND CARACTERES DA MENSAGEM*/

    int cifrada[tam];
    int decifrada[tam];

    int cifradaBits[tam*numeroBits];

/*---------------   SORTEIA PRIMOS DISTINTOS P & Q  ----------------*/
    do{
        p=getRandom();
        q=getRandom();
    }while(!ehPrimo(p) || !ehPrimo(q) || p==q);

            printf("\n\tP= %d", p);
            printf("\n\tQ= %d", q);
/*------------------------------------------------------------------*/

/*----------------  CALCULA N = P*Q, PHI=(P-1)*(Q-1)    ------------*/
    n = p*q;
    phi=(p-1)*(q-1);
    printf("\n\tF(n) Valor de PHI\t= %d",phi);
/*------------------------------------------------------------------*/

/*------- SORTEIA 'E' QUE SEJA COPRIMO DE PHI E 'E' < PHI   --------*/
    do{
        e = getRandom();
    }while(!ehCoprimo(e, phi) || e>=phi );

    printf("\n\tExpoente 'e': %d",e);
/*------------------------------------------------------------------*/

/* ---------    CALCULA D INVERSO MODULO e E PHI ---------------------*/
    d = inverso(e, phi);
/*-------------------------------------------------------------------*/

    printf("\n\tCHAVE PUBLICA\t: {%d,%d}",e,n);
    printf("\n\tCHAVE PRIVADA\t: {%d,%d}",d,n);
    cout << "\n\n";

    char cast;
    int cast4num, contador, contador2;

    printf("\n------------------RESULTADO-------------------\n\n");
    printf("\nVETOR COM NUMEROS ANTES DE ENCRIPTAR (No Equivalente a tabela ASCII):\n\n");

/*----------ABAIXO, COPIA VALOR ASCII DE CADA CARACTERE DA MENSAGEM PARA UM VETOR DE INTEIROS DO MESMO TAMANHO DA MSGM*/
    for(contador=0; contador < mensagem.length(); contador++){
               // cast4num = mensagem[contador];
                //cout<< mensagem[contador];
                cifrada[contador] =  mensagem[contador];
                //printf("ANTES[%d]: %d e cast4num: %d\n",contador, cifrada[contador],cast4num);
        }
/*--------------------------------------------------------------------------------------------------------------------*/

    for(contador=0;contador<mensagem.length();contador++){
        printf("Sem cifragem[%d]: %d \n",contador, cifrada[contador]);
    }

/*---------------------------- ABAIXO, ENCRIPTA NUMEROS DO VETOR 'CIFRADA[n]'   -------------------------------------*/
    printf("\nVETOR COM NUMEROS APOS ENCRIPTACAO (numero ASCII apos cifragem RSA):\n\n");
        for(contador=0; contador < mensagem.length(); contador++){
                cifrada[contador] = encripta(cifrada[contador],e,n);
                printf("Cifrada[%d]: %d \n",contador, cifrada[contador]);
                //converteAscii(cifrada[contador]);
        }
/*-------------------------------------------------------------------------------------------------------------------*/
    unsigned int num, itera=0, itera2=0;
    char *ponteiro;

    cout << "\nCONVERSAO DE DECIMAL para BINARIO: \n\n";

/*------------- ABAIXO, ALGORITMO CONVERTE VETOR cifrada DE NUMEROS EM CADEIA DE BITS (CADA CARACTER = 16BITS) --------------*/
    for(contador=0; contador< tam; contador++){
        ponteiro = DecToBinary(cifrada[contador]);
        cout <<  "Em Bin: " <<ponteiro ;
        printf(" - Numero equivalente CIFRADA[%d]: %d \n", contador, cifrada[contador]);
        for(contador2=0;contador2<numeroBits;contador2++){
            cifradaBits[(itera*numeroBits)+itera2] = charToInt(ponteiro[contador2]);
            itera2++;
        }
        itera2=0;
        itera++;
    }
/*---------------------------------------------------------------------------------------------------------------------*/

/*------------------------------      IMPRIME CADEIA CIFRADA EM BITS      --------------------------------------------*/
    cout<<"\n\tCADEIA DE BITS APOS CIFRAGEM\n\n";
    for(contador=0;contador<tam*numeroBits;contador++)
        printf("%d", cifradaBits[contador]);
    cout <<"\n\n";
/*-----------------------------CONVERTE VETOR DE BINARIO PARA INTEIRO ---------------------------------------------------------------------------------*/
    int numeroCifrados[tam];
    int inicio = 0;
    int fim = numeroBits;
    int palavra = 0;
    int temp;
    int conta;
        for (contador=0;contador<tam;contador++){
            for(contador2=inicio;contador2<fim;contador2++){
                ponteiro[palavra] = cifradaBits[contador2];
                palavra++;
            }

            for(conta=0;conta<numeroBits;conta++)

            temp = BinToInt(ponteiro);
            numeroCifrados[contador]= temp;
            palavra = 0;
            inicio = inicio + numeroBits;
            fim = fim + numeroBits;
        }

    cout << "\nVETOR CIFRADO DE BIN TO INT\n";
    for(contador=0; contador<tam; contador++){
        cout<<numeroCifrados[contador] << "; ";
    }
    cout << "\n";
/*------------------------------------- IMPRIME NOVO CIFRADA    -------------------------------------------------------*/
cout<<"\nMENSAGEM CIFRADA\n\n";
for(contador=0; contador < mensagem.length(); contador++){
            converteAscii(cifrada[contador]);
    }
/*----------------------------------------------------------------------------------------------------------------------*/
cout<<"\n\nMENSAGEM DECIFRADA\n";

/*----------------------ABAIXO, DECRIPTA NUMEROS DO VETOR 'numeroCifrados[n]' , SALVA EM DECIFRADA, converte em Ascii ---------------------------*/
    for(contador=0; contador < mensagem.length(); contador++){
            decifrada[contador] = numeroCifrados[contador];
            decifrada[contador] = decripta(decifrada[contador],d,n);
            converteAscii(decifrada[contador]);
    }
    cout<<"\n";
/*=============================================================================*/

    arquivo.open("entrada.bmp"); // ABRE O ARQUIVO DE IMAGEM

    int opcao;

    cout<<"DIGITE A OPCAO QUE QUER UTILIZAR. 1-ENCRIPTAR; 2-DECRIPTAR\n";
    cin>>opcao;
    int s=0;
    int lebits[tam*numeroBits];

    arquivo.seekp(0);

    switch(opcao){
        case 1:

              arquivo.seekp(54);

            /* arquivo.seekp(54);
            POSICIONA O STREAM PARA A POSIÇÃO QUE INTERESSA A NÓS,
            NO CASO, OFFSET=54, POSIÇÃO DO PRIMEIRO BYTE DE PIXEL
            */
            cout<<"VOCE ESCOLHEU ENCRIPTAR UMA MSGM\n";

            do{ //percorre caracter a caracter ateh o fim do arquivo
                if(offset>tam*numeroBits){break;};
				arquivo.get(c);
                i = c;
                cout << i ;
                LSB = i % 2; // Copia o Digito menos significativo do numero int do caracter atual

                cout << "LSB" << LSB <<"; ";

                lebits[s]=LSB;

/*-----------------TROCA BITS PELOS BITS DA MENSAGEM CIFRADA ---------------------------------*/
                if(cifradaBits[s] != LSB){
                    cout << " || TROCADO LSB do Arquivo || ";
                    if(LSB==1 || i == 255){
                            printf(" LSB 1 -> 0;");
                            i = i-1;
                    }
                    if(LSB==0 || i == 0){
                        printf(" LSB 0 -> 1; ");
                        i= i+1;
                    }
                }
/*---------------------------------------------------------------------------------------------*/

            LSB = i % 2;
            cout << " " << " Novo LSB_2: "<< LSB<<"\n";
            offset++;

            
           c=i;

            arquivo.putback(c);
            arquivo.write(&c,1); //TROCA CARACTER ATUAL POR I


            s++;
        }while(!arquivo.eof());
        
        break;
        case 2:

            arquivo.seekp(54);
            s=0;
            cout<<"\n\t LIDOSSS\n";
                while(arquivo.get(c)){ //percorre caracter a caracter ateh o fim do arquivo

                    if(s==tam*numeroBits){break;};
                    i = c;
                    LSB = i % 2; // Copia o Digito menos significativo do numero int do caracter atual

                cout <<" CifradaBits["<<s<<"]: "<<cifradaBits[s];
                cout<<"\n";
                    lebits[s]=LSB;

                        offset++;
                        //arquivo.put(i); //TROCA CARACTER ATUAL POR I
                        s++;
                }
/*-----CONVERTE LEBITS EM VETOR DE INTEIROS----------------------------*/
            cout << "\n";
            cout<<"\nBITS LIDOS:\n";

            for(contador=0;contador<tam*numeroBits;contador++){
                cout<<lebits[contador];

            }
                inicio = 0;
                fim = numeroBits;
                palavra = 0;
            for (contador=0;contador<tam;contador++){
                for(contador2=inicio;contador2<fim;contador2++){
                    ponteiro[palavra] = lebits[contador2];
                    palavra++;
                }

                temp = BinToInt(ponteiro);

                numeroCifrados[contador]= temp;
                palavra = 0;
                inicio = inicio + numeroBits;
                fim = fim + numeroBits;
            }
            cout << "\n\nVETOR CIFRADO DE BIN TO INT LIDOS DO ARQUIVO DE IMAGEM \n";
            for(contador=0; contador<tam; contador++){
                cout<<numeroCifrados[contador] << "; ";
            }

            cout << "\n";
          

            cout<<"\nDigite a chave Privada <d,n>: ";
            cin >> d;
            cin >> n;
            cout<<"\nMENSAGEM DECIFRADA\n";
            cout<<"\nChave Privada: "<< d<< "; "<<n;
            cout<<"\n\n";
/*----------------------ABAIXO, DECRIPTA NUMEROS DO VETOR 'NUMEROSCIFRADOS[INT]' , SALVA EM 'DECIFRADA[INT]' ---------------------------*/
            for(contador=0; contador < mensagem.length(); contador++){
                    decifrada[contador] = numeroCifrados[contador];
                    decifrada[contador] = decripta(decifrada[contador],d,n);
                    converteAscii(decifrada[contador]);
            }
                break;
    }

    arquivo.close(); //fecha o arquivo + salva

    return 0;
}
