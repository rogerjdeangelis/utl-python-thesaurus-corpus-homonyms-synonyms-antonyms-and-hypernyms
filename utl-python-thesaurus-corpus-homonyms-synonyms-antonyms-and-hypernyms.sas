%let pgm=utl-python-thesaurus-corpus-homonyms-synonyms-antonyms-and-hypernyms;

Python thesaurus corpus homonyms synonyms antonyms and hypernyms

github
http://tinyurl.com/362fewec
https://github.com/rogerjdeangelis/utl-python-thesaurus-corpus-homonyms-synonyms-antonyms-and-hypernyms

You need to install the natural corpi (books?)
see
https://www.nltk.org/data.html

Python has support for natural language processing, image analysis, video, music, iot and general AI.
R has very flexible in memory language.
SAS has great big daa support and performance.

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/**************************************************************************************************************************/
/*                          |                                                    |                                        */
/*    INPUT                 |     Process                                        |      Output                            */
/*                          |                                                    |                                        */
/*   1.  Python Thesaurus   |     Look up small                                  |      SD1.WANT total obs=13             */
/*   2.  The word small     |     in the Python                                  |                                        */
/*                          |     Thesaurus                                      |      Obs    SYNONYMS                   */
/*  Python has many Corpi   |                                                    |                                        */
/*                          |     from nltk.corpus import wordnet as wn;         |        1    belittled                  */
/*                          |     with open('d:/txt/synonyms.txt', 'w') as f:;   |        2    diminished                 */
/*                          |          for ss in wn.synsets(&wrd):;              |        3    humble                     */
/*                          |              f.write(ss.name());                   |        4    little                     */
/*                          |              f.write(str(ss.lemma_names())+'\n');  |        5    low                        */
/*                          |                                                    |        6    lowly                      */
/*                          |                                                    |        7    minor                      */
/*                          |                                                    |        8    minuscule                  */
/*                          |                                                    |        9    modest                     */
/*                          |                                                    |       10    pocket-size                */
/*                          |                                                    |       11    pocket-sized               */
/*                          |                                                    |       12    small                      */
/*                          |                                                    |       13    small-scale                */
/*                          |                                                    |                                        */
/**************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

 %let wrd='small';

 Python Corpus
 nltk.corpus import wordnet as wn;

 %let wrd='small';

/*         _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| `_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

*/

%utl_submit_py64_310("
from itertools import chain;
from nltk.corpus import wordnet as wn;
with open('d:/txt/synonyms.txt', 'w') as f:;
.    for ss in wn.synsets(&wrd):;
.        f.write(ss.name());
.        f.write(str(ss.lemma_names())+'\n');
");


data want;
   length infile $200;
   infile "d:/txt/synonyms.txt";
   input;
   txt=_infile_;
   if index(txt,'.s')>0;
   txt=tranwrd(txt,"u'","");
   txt=compress(txt,"',");
   txt=compbl(scan(txt,2,'[]'));
   putlog txt;
   do i=1 to countw(txt);
      synonyms=scan(txt,i,' ');
      if  synonyms = '' then leave;
      else output;
   end;
   keep synonyms;
run;quit;

proc sort data=want nodupkey;
by synonyms;
run;quit;

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  INTERMEDIATE FILE                                                                                                     */
/*  =================                                                                                                     */
/*                                                                                                                        */
/*  d:/txt/synonyms.txt                                                                                                   */
/*                                                                                                                        */
/*  small.n.01[u'small']                                                                                                  */
/*  small.n.02[u'small']                                                                                                  */
/*  small.a.01[u'small', u'little']                                                                                       */
/*  minor.s.10[u'minor', u'modest', u'small', u'small-scale', u'pocket-size', u'pocket-sized']                            */
/*  little.s.03[u'little', u'small']                                                                                      */
/*  small.s.04[u'small']                                                                                                  */
/*  humble.s.01[u'humble', u'low', u'lowly', u'modest', u'small']                                                         */
/*  little.s.07[u'little', u'minuscule', u'small']                                                                        */
/*  little.s.05[u'little', u'small']                                                                                      */
/*  small.s.08[u'small']                                                                                                  */
/*  modest.s.02[u'modest', u'small']                                                                                      */
/*  belittled.s.01[u'belittled', u'diminished', u'small']                                                                 */
/*  small.r.01[u'small']                                                                                                  */
/*                                                                                                                        */
/*  SYNONMYS                                                                                                              */
/*  ========                                                                                                              */
/*                                                                                                                        */
/*  SD1.WANT total obs=13                                                                                                 */
/*                                                                                                                        */
/*  Obs    SYNONYMS                                                                                                       */
/*                                                                                                                        */
/*    1    belittled                                                                                                      */
/*    2    diminished                                                                                                     */
/*    3    humble                                                                                                         */
/*    4    little                                                                                                         */
/*    5    low                                                                                                            */
/*    6    lowly                                                                                                          */
/*    7    minor                                                                                                          */
/*    8    minuscule                                                                                                      */
/*    9    modest                                                                                                         */
/*   10    pocket-size                                                                                                    */
/*   11    pocket-sized                                                                                                   */
/*   12    small                                                                                                          */
/*   13    small-scale                                                                                                    */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
