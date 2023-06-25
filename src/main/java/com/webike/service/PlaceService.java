package com.webike.service;

import com.webike.dto.JsonResult;
import com.webike.pojo.Category;
import com.webike.pojo.Place;

import java.util.List;


public interface PlaceService {
    List<Place> findAll();

    JsonResult update(Place place);

    JsonResult add(Place place);

    JsonResult deleteById(Integer pid);

    Place findById(Integer pid);
}
