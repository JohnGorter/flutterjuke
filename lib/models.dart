import 'package:flutter/material.dart';

class Album {
  Album({this.title, this.tracklist, this.demotrack, this.artist, this.albumArt});
  
  final String title;
  final List<String> tracklist;
   final String demotrack;
  final String artist;
  final String albumArt;
  }

  // List<Album> playlist = [
  //   Album(artist: "Abba", demotrack:"https://firebasestorage.googleapis.com/v0/b/todoapp-7013c.appspot.com/o/abba.mp3?alt=media&token=7c62b400-e254-4019-94ae-d2c2ad8f558b", albumArt: AssetImage("assets/img/abba.jpg"), title: "The Greatest Hits", tracklist: [
  //   "Dancing Queen (1976)",
  //   "Knowing Me, Knowing You (1977)",
  //   "Take a Chance on Me (1978)",
  //   "Mamma mia (1975)",
  //   "Lay All Your Love on Me (1980)",
  //   "Super Trouper (1980)",
  //   "I Have A Dream (1979)",
  //   "The Winner Takes It All (1980)",
  //   "Money, Money, Money (1976)",
  //   "S.O.S. (1975)",
  //   "Chiquitita (1979)",
  //   "Fernando (1976)",
  //   "Voulez-Vous (1979)",
  //   "Gimme! Gimme! Gimme! (A Man After Midnight) (1979)",
  //   "Does Your Mother Know (1979)",
  //   "One Of Us (1981)",
  //   "The Name Of The Game (1977)",
  //   "Thank You for the Music (1977)",
  //   "Waterloo (1974)",
  //   ]),
  //   Album(artist: "Queen", demotrack:"https://firebasestorage.googleapis.com/v0/b/todoapp-7013c.appspot.com/o/queen.mp3?alt=media&token=a4d1232e-8ea3-4a8c-99f8-cab8b30848a3", albumArt: AssetImage("assets/img/queen.jpg"), title: "The Miracle", tracklist: [
  //   "1.	Party (Deacon, May, Mercury)",
  //   "2.	Khashoggi's Ship (Mercury, Queen)",
  //   "3.	The Miracle (Mercury, Queen)",
  //   "4.	I Want It All (May)",
  //   "5.	The Invisible Man (Taylor)",
  //   "6.	Breakthru (Mercury, Taylor)",
  //   "7.	Rain Must Fall (Deacon, Mercury)",
  //   "8.	Scandal (May)",
  //   "9.	My Baby Does Me (Deacon, Mercury)",
  //   "10.	Was It All Worth It (Mercury)"
  //   ]),
  //   Album(artist: "AC/DC", demotrack:"https://firebasestorage.googleapis.com/v0/b/todoapp-7013c.appspot.com/o/acdc.mp3?alt=media&token=270a6ff9-af79-4b41-a7d0-dd434a1ad7b1", albumArt: AssetImage("assets/img/acdc.jpg"), title: "For Those About To Rock", tracklist: [
  //   "1.	For Those About to Rock (We Salute You)",
  //    "2. Put the Finger on You",	
  //   "3. Let's Get It Up",	
  //   "4. Inject the Venom",
  //   "5. Snowballed",	
  //   "6. Evil Walks",	
  //   "7. C.O.D.",	
  //   "8. Breaking the Rules",	
  //   "9. Night of the Long Knives",
  //   "10. Spellbound",
  //   ]),
  //   Album(artist: "Rolling Stones", demotrack:"https://firebasestorage.googleapis.com/v0/b/todoapp-7013c.appspot.com/o/rollingstones.mp3?alt=media&token=cd9789a2-98b3-407d-b11f-ec51f1172a12", albumArt: AssetImage("assets/img/rollingstones.jpg"), title: "Sticky Fingers", tracklist: [
  //   "1. Brown Sugar",
  //   "2. Sway",
  //   "3. Wild Horses",
  //   "4. Can't You Hear Me Knocking",
  //   "5. You Gotta Move (Fred McDowell/Rev. Gary Davis)",
  //   "6. Bitch",
  //   "7. I Got The Blues",
  //   "8. Sister Morphine",
  //   "9. Dead Flowers",
  //   "10. Moonlight Mile",
  //   ]),
  //   Album(artist: "Bon Jovi", demotrack:"https://firebasestorage.googleapis.com/v0/b/todoapp-7013c.appspot.com/o/bonjovi.mp3?alt=media&token=227892ea-5347-4903-b545-a69c8b66b464", albumArt: AssetImage("assets/img/bonjovi.jpg"), title: "Slippery When Wet", tracklist: [
  //   "1. Let It Rock",
  //   "2. You Give Love a Bad Name",
  //   "3. Livin' on a Prayer",
  //   "4. Social Disease",
  //   "5. Wanted Dead or Alive",
  //   "6. Raise Your Hands",
  //   "7. Without Love",
  //   "8. I'd Die for You",
  //   "9. Never Say Goodbye",
  //   "10. Wild in the Streets",
  //   ])
  // ];