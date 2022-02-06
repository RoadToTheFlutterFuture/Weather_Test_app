/*
* Convert speed m/s to km/h
*/

num getSpeedInKH({required num speed}){
    return speed * 3.6;
}

/*
* Convert meteorological degrees to compass Directions
*/

String getCompasDirection({required num deg}){
    if((deg >= 0 && deg <= 10) || (deg >= 350 && deg <= 360)) {
        return 'N';
    } else 
    if(deg > 10 && deg <= 80){
        return 'NE';
    } else 
    if(deg > 80 && deg < 100){
        return 'E';
    } else
    if(deg > 100 && deg <= 170){
        return 'SE';
    } else
    if(deg > 170 && deg <= 190){
        return 'S';
    } else
    if(deg > 190 && deg <= 260){
        return 'SW';
    } else
    if(deg > 260 && deg <= 280){
        return 'W';
    } else 
    if(deg > 280 && deg < 350){
        return 'NW';
    } else {
        return '';
    }
}


