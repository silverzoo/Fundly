package com.fundly.project.service;

import com.fundly.project.model.GiftItemDetailMapper;
import com.fundly.project.model.GiftMapper;
import com.fundly.project.model.ItemMapper;
import com.persistence.dto.GiftDto;
import com.persistence.dto.GiftItemDetailDto;
import com.persistence.dto.ItemDto;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.BDDMockito.given;

@Slf4j
@ExtendWith(MockitoExtension.class)
class ItemServiceImplTest {
    //Service단에서는 무엇을 테스트할것인가?
    //Mapper가 정상 호출되었는지를 테스트

    @Mock
    ItemMapper itemMapper;
    @Mock
    GiftMapper giftMapper;
    @Mock
    GiftItemDetailMapper giftItemDetailMapper;
    @InjectMocks
    ItemServiceImpl itemService;

    ItemDto itemDto;
    GiftDto giftDto;
    GiftItemDetailDto dto;
    List<ItemDto> list;

    @BeforeEach
    void setUp() {
        itemDto = ItemDto.builder()
                .item_id(1)
                .pj_id("pj1")
                .item_name("아이템1")
                .item_option_type("객관식")
                .item_option("옵션1, 옵션2, 옵션3")
                .build();

        giftDto = GiftDto.builder()
                .gift_id("1")
                .pj_id("pj1")
                .gift_name("선물A")
                .build();

        dto = GiftItemDetailDto.builder()
                .gift_item_id(1)
                .gift_id(giftDto.getGift_id())
                .item_qty(itemDto.getItem_id())
                .item_qty(3)
                .build();

        list = new ArrayList<>(5);
    }


    @Test
    @SneakyThrows
    @DisplayName("프로젝트의 아이템 수 세기")
    void getItemCount() {
        //해당 프로젝트의 모든 아이템 수를 센다
        //given
        given(itemMapper.count("pj1")).willReturn(5);
//        when(itemMapper.count("pj1")).thenReturn(5);

        //when
        int cnt = itemService.getItemCount("pj1");
        //then
        assertThat(cnt).isEqualTo(5);

    }

    @Test
    @SneakyThrows
    @DisplayName("해당 프로젝트에 등록된 모든 아이템")
    void getItemList() {
        //given
        given(itemMapper.selectAllFromPj("pj1")).willReturn(list);
        //when
        List list2 = itemService.getItemList("pj1");
        //then
        assertThat(list2).isEqualTo(list);
    }

    @Test
    @SneakyThrows
    @DisplayName("(모든 프로젝트의) 모든 아이템 가져오기")
    void getItemList2() {
        List<ItemDto> list = new ArrayList<>(20);
        //given
        given(itemMapper.selectAll()).willReturn(list);
        //when
        List list2 = itemService.getItemList();
        //then
        assertThat(list2).isEqualTo(list);
    }

    @Test
    @SneakyThrows
    @DisplayName("특정 아이템 가져오기")
    void getItem() {
        //given
        given(itemMapper.select(1)).willReturn(itemDto);
        //when
        ItemDto itemDto2 = itemService.getItem(1);
        //then
        assertThat(itemDto2).isEqualTo(itemDto);

    }

    @Test
    @SneakyThrows
    @DisplayName("아이템 등록하기")
    void registerItem() {
        //given
        given(itemMapper.insert(itemDto)).willReturn(1);
        //when
        int rowCnt = itemService.registerItem(itemDto);
        //then
        assertThat(rowCnt).isEqualTo(1);

    }

    @Test
    @SneakyThrows
    @DisplayName("아이템 수정하기")
    void modifyItem() {
        //given
        given(itemMapper.update(itemDto)).willReturn(1);
        //when
        itemDto.setItem_name("아이템2");
        int rowCnt = itemService.modifyItem(itemDto);
        //then
        assertThat(rowCnt).isEqualTo(1);
    }

    @Test
    @SneakyThrows
    @DisplayName("모든 아이템 삭제")
    void removeAll() {
        //given
        given(itemMapper.deleteAll()).willReturn(10);
        //when
        int rowCnt = itemService.removeAll();
        //then
        assertThat(rowCnt).isEqualTo(10);
    }

    @Test
    @SneakyThrows
        //Tx의 경우 어떻게 테스트를 하지...??
    void remove() {
        //특정 아이템을 삭제하면, 특정 아이템을 포함한 모든 선물들도 삭제되어야 한다.
        given(itemMapper.delete(itemDto.getItem_id())).willReturn(1);
        int rowCnt = itemService.remove(itemDto.getItem_id());
        assertThat(rowCnt).isEqualTo(1);

    }
}