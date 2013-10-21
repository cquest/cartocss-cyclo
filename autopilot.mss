

Map {
  buffer-size: 128;
}

@book-fonts: "DejaVu Sans Book", "unifont Medium";
@bold-fonts: "DejaVu Sans Bold", "unifont Medium";
@oblique-fonts: "DejaVu Sans Oblique", "unifont Medium";

@water-color: #b5d0d0;
@land-color: #f2efe9;
@trunk_color: #9de09d; // #a9dba9
@primary_color: #ec989a;
@motorway_color: #809bc0;
@shield_spacing: 750;


@couleur-voie: #f84;  	 // orange
@couleur-piste: #080;    // vert
@couleur-interdit: #f00; // rouge
@couleur-autorise: #0f0; // vert clair
@route: #b8b;            // rose

.cycleway [zoom>=10] {
  line-width:0;
  line-color:#666;
  line-join: round;
  line-cap: round;
  opacity: 0.7;

  // itinéraires (route=bicycle)
  [route='bicycle'] {
    line-color: @route;
    line-width: 10;
  }
  
  // pistes (vert épais)
  [zoom >=12] {
    [highway='cycleway'],
    [cycleway='track'],
    [cycleway_l='track'],
    [cycleway_r='track'] {
      line-width: 4;
      line-color:@couleur-piste;
    }
  }

  [zoom>=12] {
  // double-sens cyclable (orange)
  [cycleway='opposite'],
    // voies cyclables (orange)
  [cycleway='lane'],[cycleway_l='lane'],[cycleway_r='lane'] {
    line-width: 4;
    line-color: @couleur-voie;
  }
  [bicycle_lanes='yes'], [bicycle_lanes='designated'],[bicycle='designated'] {
    line-width: 1;
    line-color: @couleur-voie;
  }
  // partagé avec les bus (orange épais)
  [cycleway='share_busway'],
  [cycleway_l='share_busway'],
  [cycleway_r='share_busway'] {
    line-width: 4;
    line-color: @couleur-voie;
  }
  [bicycle='designated'] {
    line-width: 4;  
  }
  }
  
  // autorisé vélo (vert-clair)
  [zoom>13][bicycle='yes'] {
    line-width: 4;  
    line-color: @couleur-autorise;
  }
  
  
  // interdit vélo (rouge)
  [bicycle='no'][zoom>14] {
    line-width: 4;  
    line-color: @couleur-interdit;
  }
  
   // inconnu  [highway='path'],[highway='footway']

}


#poi [zoom>14] {
  marker-width:6;
  marker-fill:grey;
  marker-line-width:0;
  marker-allow-overlap:true;
  [amenity='bicycle_parking'] { marker-fill: blue; }
  [shop='bicycle'] { marker-fill: orange; }
  [highway='steps'] { marker-fill: red; }
}
