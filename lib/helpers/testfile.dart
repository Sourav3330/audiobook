// main (){
//   int reviews = 50000000;
//
//   String totalReviews(int reviews){
//     if(reviews>=1000000){
//       double value = reviews/1000000;
//       return '${value%1==0?value.toInt():value.toStringAsFixed(1)}M';
//     }
//     else if(reviews>=1000){
//       double value = reviews/1000;
//       return '${value%1==0?value.toInt():value.toStringAsFixed(1)}K';
//     }
//     return reviews.toString();
//
//   }
//   print(totalReviews(reviews));
// }