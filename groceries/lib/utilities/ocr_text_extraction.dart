

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:string_similarity/string_similarity.dart';

import '../screens/account/verify_account_details.dart';

Future<List<String>>extractText(String lines)async{
 List<String> rawText = lines.split('\n');
   var text1= StringSimilarity.findBestMatch('ECOWAS IDENTITY CARD', rawText);
  var text2 = StringSimilarity.findBestMatch('CAETE D\'IDENTITE CEDEAO / BILHETE DE IDENTIDADE CEDEAO', rawText);
   var text3 = StringSimilarity.findBestMatch('REPUBLIC OF GHANA', rawText);
   var text4 = StringSimilarity.findBestMatch('SurnameNom', rawText);
   var text5 = StringSimilarity.findBestMatch('FirstnamesPrénoms', rawText);
   var text6 = StringSimilarity.findBestMatch("Previous Names(s)/Noms Precedents", rawText);
   var text7 = StringSimilarity.findBestMatch("Nationality Nationalitě", rawText);
   var text8 = StringSimilarity.findBestMatch("Date ofBrth Date de Naissance", rawText);
   var text9 = StringSimilarity.findBestMatch("Personal ID Number", rawText);
   var text10 = StringSimilarity.findBestMatch("HeightTaille(m)", rawText);
   var text11 = StringSimilarity.findBestMatch("SexSexe", rawText);
   var text12 = StringSimilarity.findBestMatch("Document NumberNuméro du document", rawText);
   var text13 = StringSimilarity.findBestMatch("Place of Issuance Lieu de délivrance", rawText);
   var text14 = StringSimilarity.findBestMatch("Date of Issuance Dare d'émission", rawText);
   var text15 = StringSimilarity.findBestMatch("Date of Expiry Date d'expiration", rawText);
     
    for (int i =0; i< rawText.length; i++){
        if(rawText[i].contains(text1.bestMatch.target!)){
          rawText.remove(rawText[i]);
           Logger().i(rawText.toString());
        }
         if(rawText[i].contains(text2.bestMatch.target!)){
          rawText.remove(rawText[i]);
           Logger().i(rawText.toString());
        }  
         if(rawText[i].contains(text3.bestMatch.target!)){
          rawText.remove(rawText[i]);
           Logger().i(rawText.toString());
        }  
         if(rawText[i].contains(text4.bestMatch.target!)){
          rawText.remove(rawText[i]);
           Logger().i(rawText.toString());
        } 
         if(rawText[i].contains(text5.bestMatch.target!)){
          rawText.remove(rawText[i]);
           Logger().i(rawText.toString());
        }
         if(rawText[i].contains(text6.bestMatch.target!)){
          rawText.remove(rawText[i]);
           Logger().i(rawText.toString());
        }
         if(rawText[i].contains(text7.bestMatch.target!)){
          rawText.remove(rawText[i]);
           Logger().i(rawText.toString());
        }
         if(rawText[i].contains(text8.bestMatch.target!)){
          rawText.remove(rawText[i]);
           Logger().i(rawText.toString());
        }
         if(rawText[i].contains(text9.bestMatch.target!)){
          rawText.remove(rawText[i]);
           Logger().i(rawText.toString());
        }
         if(rawText[i].contains(text10.bestMatch.target!)){
          rawText.remove(rawText[i]);
           Logger().i(rawText.toString());
        } 
         if(rawText[i].contains(text11.bestMatch.target!)){
          rawText.remove(rawText[i]);
           Logger().i(rawText.toString());
        }
         if(rawText[i].contains(text12.bestMatch.target!)){
          rawText.remove(rawText[i]);
           Logger().i(rawText.toString());
        }
         if(rawText[i].contains(text13.bestMatch.target!)){
          rawText.remove(rawText[i]);
           Logger().i(rawText.toString());
        } 
         if(rawText[i].contains(text14.bestMatch.target!)){
          rawText.remove(rawText[i]);
           Logger().i(rawText.toString());
        }
         if(rawText[i].contains(text15.bestMatch.target!)){
          rawText.remove(rawText[i]);
           Logger().i(rawText.toString());
        }                     
    }  
  return rawText;
   
}