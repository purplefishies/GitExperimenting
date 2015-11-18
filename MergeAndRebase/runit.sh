git init .
echo -ne "Title of book\n\n" > book.txt
git add book.txt
git commit -m "Initial"
git checkout -b exp_chapter
sleep 2
echo -ne "\n\nChapter 1 \nSomething" >> book.txt 
git commit -am "First chapter"
sleep 2
echo -ne "\n\nChapter 2 \nAnother thing\n" >> book.txt 
echo -ne "\n\nChapter 3 \nAnd another\n" >> book.txt 
git commit -am "2nd and 3rd chapter"

git checkout -b exp_chapter_trial
echo -ne "\n\nChapter 4 \nOther stuff\n" >> book.txt 
git commit -am "Ch4"
echo -ne "\n\nChapter 5 \nOther stuff\n" >> book.txt 
git commit -am "Ch5"

git checkout exp_chapter
git merge --no-edit --no-ff exp_chapter_trial

git checkout master

git merge --no-edit --no-ff exp_chapter 


# Merge back into main
# I needed the sleep statements
# so that the log doesn't get written in an incorrect way
#
echo -ne "\n\nChapter 6 \nOther stuff\n" >> book.txt 
git commit -am "Ch6"

echo -ne "\n\nChapter 7 \nNot written\n" >> book.txt  
git commit -am "Ch7"       

git checkout exp_chapter
echo -ne "\n\n\n\n\nChapter 8" > chapter_8.txt
sleep 1
git add chapter_8.txt
git commit -am "Ch8"       

#
#
git checkout exp_chapter
git rebase master

#
# Followed by 
#
git checkout master
git merge --no-ff --no-edit exp_chapter


#
# This applies the patch at the head of it , 
#

git log --graph --oneline --decorate


#
# This example allows us to get the main branch fixes...useful
# when you need to adjust to what has been going on in main
#

echo -ne "\n\n Test\n" >> chapter_8.txt
echo -ne "\n\nChapter 8 \nNot written\n" >> book.txt  
