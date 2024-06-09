[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project
THIS DOCUMENT IS REQUIRED

## Names
Jackie Zeng, Grant Gao

## Group Name
PureJZ

## Overview
We created an interactive chess game in processing that allows two people to compete against each other on a virtual board. The game includes all the standard chess features such as piece movement, turn-based gameplay, legal move generation, and special moves like castling and pawn promotion.  Additionally, it includes many features that enhance the player's experience, such as a timer, highlighting possible moves for each piece, displaying if you're in check/checkmate, and a timer. This game was aimed to be a recreation of chess, with a player-friendly interface. 

## Instructions
First, select a time control and then start the game. The gameplay is normal chess. To see rook moves click R, to see queen moves click Q, to see bishop moves click B, and to see knight moves click N. However if you want to play the game after clicking one of these keys you have to rerun. To undo a move click U. You can undo to the very beginning. 

## Video Link
https://drive.google.com/file/d/1LV8RKtGJvjhubMZaWgyIhP2J7TEvIMlC/view?usp=sharing

## Bug
There is a bug such that if you make a move that allows both sides to castle, the game will crash because of too much recursion/stack overflow error
