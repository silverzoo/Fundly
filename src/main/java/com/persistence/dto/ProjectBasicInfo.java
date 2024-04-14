package com.persistence.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProjectBasicInfo {
    private String pj_id;
    private String sel_name;
    private String ctg;
    private String sub_ctg;
    private String pj_short_title;
    private String pj_long_title;
    private List<String> tags;
}
