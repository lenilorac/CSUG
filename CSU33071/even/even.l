%{
  int even = 0;
%}

%%

[0-9]*[02468][ \t\n\r\f\v]+	{even++;}
[a-zA-Z]			{}
.				{}

%%

int main(){
  yylex();
  printf("%d\n", even);
  return 0;
}
