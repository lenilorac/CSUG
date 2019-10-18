%{
  int currentY = 2019;

  void printYear(){
    char * text = yytext;
    int d1 = (int)text[0] - 48;
    int d2 = (int)text[1] - 48;
    int year = d1 * 10 + d2;
    if (year >= 87){
      printf("%i\n", currentY - (1900 + year));
    } else {
      printf("%i\n", currentY - (2000 + year));
    }
  }
%}
 
NUMBER     [0-9]{1,6}[ \t\n]+
NEWCOUNTY  C|CE|CN|CW|D|DL|G|KE|KK|KL|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW
OLDCOUNTY  C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LK|LM|LS|MH|MN|MO|OY|RN|SO|TN|TS|W|WD|WH|WX|WW
CURRYEAR   [1][4-9][12]
OLDYEAR    [0-9][0-9]
SPYEAR     [1][3][12]

%%

({OLDYEAR}|{SPYEAR})-{OLDCOUNTY}-{NUMBER}    {printYear();}
{CURRYEAR}-{NEWCOUNTY}-{NUMBER}              {printYear();}
.+[ \t\n]				     {printf("INVALID\n");}
\n					     {}

%%

int main(){
  yylex();
  return 0;
}
