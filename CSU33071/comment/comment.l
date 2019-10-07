%{
  int comment = 0;
%}

%%
\n		{if(comment == 0){printf("%s", yytext);}}
"**".*		{}
"{"		{if(comment==0){comment = 1;}}
"}"		{if(comment == 0){printf("syntax error\n"); return 0;}  else{comment = 0;}}
\".*\"		{printf("%s", yytext);}
.		{if(comment == 0){printf("%s", yytext);}}
%%

int main()
{
  yylex();
  if(comment == 1) printf("syntax error\n");
  return 0;
}
