import java.util.Random; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

/* 
 CISC 3665 (Game Design, Fall '18) - Project 1
 Group 4
 Game: Matching Pennies
 Team:
 - Abdullah Gulfam
 - Ahmad Raza
 - Benjamin Kats
 - Huoliang Chen
 - Joel Franco
 */

color backgroundColor = color(0);                      // Black
int w = width, h = height;                             // Width and Height
Card[] cards = new Card[9];                            // 9 cards to be arranged into a 3x3 grid
//String[] values = {"wildcard", "heads", "tails"};    // Values used when generating each of the 9 cards
//int headsCount, tailsCount, wildcardCount;           // Tracks number of 'heads', 'tails', and 'wildcard' generated                           
boolean gameState = false;  
Player player1, player2;                             


void setup() {
  size(800, 650);
  background(backgroundColor);

  generateCards();
  player1 = new Player();
  player2 = new Player();

  createGrid();
  textAlign(CENTER);
  text("Both players have a penny and choose either heads or tails.", width/2, height/8);
  text("If they match, Player 1 wins. If not, Player 2 wins.", width/2, height/6);
  //textAlign(RIGHT);
  //text("Player 1 press 'Q' for heads or 'W' for tails", width/2 - 20, height/3 + 20);
  //textAlign(LEFT);
  //text("Player 2 press 'O' for heads or 'P' for tails", width/2 + 30, height/3 + 20);
  textAlign(CENTER);
  text("Press space to reset", width/2, height - 50);
}

void draw() {
  createGrid();
}

void keyPressed() {
  if (key == ' ') {
    gameState = false;
    reset();
  }
}

void mouseClicked() {
  for (int i = 0; i < cards.length; i++) {
    cards[i].setClicked();
  }
}

void reset() {
  gameState = false;
  setup();
}

void generateCards() {
  int num = 0, wildcardCount = 0, headsCount = 0, tailsCount = 0;
  ArrayList<String> cardValues = new ArrayList();
  cardValues.add("wildcard");  // Wildcard
  cardValues.add("heads");     // Heads
  cardValues.add("tails");     // Tails
  Random random = new Random();

  for (int i = 0; i < 9; i++) {
    num = random.nextInt(cardValues.size());
    if (num == 0) {
      if (wildcardCount == 1) {
        num = random.nextInt(cardValues.size());
      } else {
        wildcardCount++;
      }
    } else if (num == 1) {
      if (headsCount == 4) {
        num = random.nextInt(cardValues.size());
      } else {
        headsCount++;
      }
    } else if (num == 2) {
      if (tailsCount == 4) {
        num = random.nextInt(cardValues.size());
      } else {
        tailsCount++;
      }
    }
    cards[i] = new Card(cardValues.get(num));
  }
}
