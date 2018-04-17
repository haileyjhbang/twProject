<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소 검색 / 면적 확인</title>
    <link rel="stylesheet" href="common.css">
</head>
<body>

<form>
    <input type="hidden" id="powerDay" value="${powerDay}">
    <input type="hidden" id="drawingPolygon" value="${drawingPolygon}">

    <div class="top">
        <div class="area">
            <div id="inputtext">
                <input type="text" name="address" id="address" value="${address}" readonly></div>
            <div id="inputbutton">
                <input type="button" value="주소"></div>
        </div>

        <div class="area2">
            <div id="areatitle">면적기준</div>
            <div id="arearadio">
                &nbsp;&nbsp;${type == 'sgg' ? '시/군/구' : ''}${type == 'emd' ? '읍/면/동' : ''}${type == 'li' ? '리' : ''}
            </div>
        </div>
    </div>

    <br/>

    <div id="map" style="width:100%;height:400px;"></div>

    <div class="contents">
        <div class="contents1">
            <div class="areamp">
                <ul>
                    <li>지번구역 면적</li>
                    <li><input text="text" id="polyAreaMiterPeang" value="${polyAreaMiterPeang}" onkeyup="calculatePolyAreaMiterPeang(this)">평</li>
                    <li><input type="text" id="polyAreaMiter" value="${polyAreaMiter}" onkeyup="calculatePolyAreaMiter(this)">㎡</li>
                </ul>

                <ul>
                    <li>마우스선택 면적</li>
                    <li><input text="text" id="polyPathPeang" value="${polyPathPeang}" onkeyup="calculatePolyPathPeang(this)">평</li>
                    <li><input type="text" id="polyPathMiter" value="${polyPathMiter}" onkeyup="calculatePolyPathMiter(this)">㎡</li>
                </ul>
            </div>

            <div class="section02">
                <ul class="field00">
                    <li>설치용량(kw)</li>
                    <li><input type="text" name="scale" id="scale" value="<fmt:formatNumber value="${scale}" type="number"/>" readonly>kw</li>
                </ul>
                <ul class="field00">
                    <li>설치단가</li>
                    <li><input type="text" name="unitPrice" id="unitPrice" value="<fmt:formatNumber value="${unitPrice}" type="number"/>" >원</li>
                </ul>
                <ul class="field00">
                    <li>금융대출(%)</li>
                    <li><input type="text" name="loanPercent" id="loanPercent" value="${loanPercent}">%</li>
                </ul>
                <ul class="field00">
                    <li>대출이율</li>
                    <li><input type="text" name="profit" id="profit" value="${profit}">%</li>
                </ul>

            </div>

            <div class="section03">
                <span class="field02">자금조건</span>
                <ul class="field01">
                    <li>총투자비</li>
                    <li><input type="text" name="totalInvestment" id="totalInvestment" value="<fmt:formatNumber value="${totalInvestment}" type="number"/>" readonly>원</li>
                </ul>
                <ul class="field01">
                    <li>자기자본</li>
                    <li><input type="text" name="myCapital" id="myCapital" value="<fmt:formatNumber value="${myCapital}" type="number"/>" readonly>원</li>
                </ul>

                <ul class="field01">
                    <li>금융대출(원)</li>
                    <li><input type="text" name="loan" id="loan" value="<fmt:formatNumber value="${loan}" type="number"/>" readonly>원</li>

                </ul>
                <ul class="field01">
                    <li>상환기간</li>
                    <li><input type="text" name="repayPeriod" id="repayPeriod" value="${repayPeriod}" readonly>년</li>
                </ul>
            </div>

        </div>

        <div class="contents2">
            <div>
                <span class="field02">발전조건</span>
                <ul class="field01">
                    <li>일평균 발전시간</li>
                    <li><input type="text" name="powerTime" id="powerTime" value="${powerTime}" readonly>시간</li>
                </ul>

                <ul class="field01">
                    <li>연간 효율저감률</li>
                    <li><input type="text" name="efficiencyRate" id="efficiencyRate" value="${efficiencyRate}">%</li>
                </ul>
                <ul class="field01">
                    <li>SMP단가</li>
                    <li><input type="text" name="smpUnit" id="smpUnit" value="<fmt:formatNumber value="${smpUnit}" type="number"/>">원</li>
                </ul>
                <ul class="field01">
                    <li>SMP상승률</li>
                    <li><input type="text" name="smpRate" id="smpRate" value="${smpRate}" readonly>%</li>
                </ul>
                <ul class="field01">
                    <li>REC단가</li>
                    <li><input type="text" name="recUnit" id="recUnit" value="<fmt:formatNumber value="${recUnit}" type="number"/>" readonly>원</li>
                </ul>
                <ul class="field01">
                    <li>가중치</li>
                    <li><input type="text" name="weight" id="weight" value="${weight}" readonly>배</li>
                </ul>


            </div>
            <div>
                <span class="field02">지출비용</span>
                <ul class="field01">
                    <li>보험료</li>
                    <li><input type="text" name="insuranceRate" id="insuranceRate" value="${insuranceRate}" readonly>%</li>
                </ul>
                <ul class="field01">
                    <li>유지보수비</li>
                    <li><input type="text" name="maintenanceUnit" id="maintenanceUnit" value="${maintenanceUnit}" readonly>%</li>
                </ul>

            </div>
        </div>

    </div>

    <div class="layoutTable">
        <div class="content3">
            <div class="income">
                <ul class="field03">
                    <li>월평균 수익</li>
                    <li><input type="text" name="netIncomeMonthDisplay" id="netIncomeMonthDisplay" value="" class="wDisplay" readonly="">원</li>
                </ul>
                <ul class="field03">
                    <li>연평균 수익</li>
                    <li><input type="text" name="netIncomeYearDisplay" id="netIncomeYearDisplay" value="" class="wDisplay" readonly=""> 원</li>
                </ul>
                <ul class="field03">
                    <li>평균 수익율</li>
                    <li><input type="text" name="netIncomeRaiteDisplay" id="netIncomeRaiteDisplay" value="" class="wDisplay" readonly="">%</li>
                </ul>
            </div>
            <div class="incomebutton">
                <div class="buttonshow">
                    <button type="button" onclick="calculationBasis(this.value)" value="show">산출근거</button>
                </div>
                <%--<div class="buttonprint">--%>
                    <%--<button type="button" onclick="window.print()">인쇄하기</button>--%>
                <%--</div>--%>
            </div>
        </div>


        <div class="chartjs-wrapper">
            <canvas id="myChart"></canvas>
        </div>
    </div>

    <br/>

    <p/>

    <table id="calculateCostTable" style="display:none ">
        <tr class="tHead">
            <th>구분</th>
            <th colspan="3">수입</th>
            <th colspan="4">지출</th>
            <th></th>
            <th colspan="2">수익총계</th>
        </tr>
        <tr class="tHead">
            <th rowspan="2">연차</th>
            <th rowspan="2">연간전력생산량</th>
            <th>SMP</th>
            <th rowspan="2">연수익</th>
            <th rowspan="2">유지보수비</th>
            <th rowspan="2">보험료</th>
            <th rowspan="2">원금상환</th>
            <th rowspan="2">이자</th>
            <th rowspan="2">상환후잔액</th>
            <th rowspan="2">순수익</th>
            <th rowspan="2">수익률(%)</th>
        </tr>
        <tr class="tHead">
            <th>REC</th>
        </tr>
    </table>


    <div class="buttonprint">
        <button type="button" onclick="window.print()">인쇄하기</button>
    </div>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=${apiKeyDaum}&libraries=services"></script>
<script>
    var labels = new Array();
    var barDataset = new Array();
    var lineDataset = new Array();

    $(document).ready(function () {
        setMap();
        calculateCostTable();
        drawChart();
    });

    function setMap() {
        if (!$('#drawingPolygon').val()) $('#drawingPolygon').val('(36.503296, 127.271260)');

        var centerLat = 0;
        var centerLng = 0;
        var polygonPath = new Array();
        var drawingPolygonData = $('#drawingPolygon').val().split('),(');
        var point;
        $.each(drawingPolygonData, function (i) {
            point = drawingPolygonData[i].split(' ').join('').split('(').join('').split(')').join('').split(',');

            // 다각형을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 다각형을 표시합니다
            polygonPath[i] = new daum.maps.LatLng(point[0] * 1, point[1] * 1);

            centerLat += point[0] * 1;
            centerLng += point[1] * 1;
        });

        centerLat = centerLat / drawingPolygonData.length;
        centerLng = centerLng / drawingPolygonData.length;

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new daum.maps.LatLng(centerLat, centerLng), // 지도의 중심좌표
                level: 6 // 지도의 확대 레벨
            };

        //지도를 미리 생성
        var map = new daum.maps.Map(mapContainer, mapOption);

        // 지도에 표시할 다각형을 생성합니다
        var polygon = new daum.maps.Polygon({
            path: polygonPath, // 그려질 다각형의 좌표 배열입니다
            strokeWeight: 2, // 선의 두께입니다
            strokeColor: '#39DE2A', // 선의 색깔입니다
            strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle: 'longdash', // 선의 스타일입니다
            fillColor: '#A2FF99', // 채우기 색깔입니다
            fillOpacity: 0.4 // 채우기 불투명도 입니다
        });

        // 지도에 다각형을 표시합니다
        polygon.setMap(map);
    }

    function calculateCostTable() {
        var duration = 20;
        var annualPower = 0;
        var totalAnnualPower = 0;
        var smpUnit = 0;
        var smp = 0;
        var recUnit = replaceAllComma($('#recUnit').val());
        var weight = replaceAllComma($('#weight').val());
        var rec = 0;
        var annualProfit = 0;
        var totalAnnualProfit = 0;
        var maintenanceUnit = replaceAllComma($('#maintenanceUnit').val());
        var maintenance = 0;
        var totalMaintenance = 0;
        var insuranceRate = replaceAllComma($('#insuranceRate').val());
        var insuranceFee = 0;
        var totalInsuranceFee = 0;
        var loan = replaceAllComma($('#loan').val());
        var repayPeriod = replaceAllComma($('#repayPeriod').val());
        var repayPeriod2 = repayPeriod;
        var payback = 0;
        var totalPayback = loan;
        var interestCount = 1;
        var leftBalance = loan;
        var profit = replaceAllComma($('#profit').val());
        var interest = 0;
        var totalInterest = 0;
        var netIncome = 0;
        var totalNetIncome = 0;
        var totalInvestment = replaceAllComma($('#totalInvestment').val());
        var profitRate = 0;

        for (var i = 0; i < duration; i++) {
            labels[i] = i + 1;
            if (i == 0) {
                annualPower = replaceAllComma($('#scale').val()) * replaceAllComma($('#powerTime').val()) * replaceAllComma($('#powerDay').val());
                totalAnnualPower += annualPower;
                smpUnit = replaceAllComma($('#smpUnit').val()) * 1;
                smp = annualPower * smpUnit;
                rec = recUnit * weight * annualPower;
                annualProfit = smp + rec;
                totalAnnualProfit += annualProfit;
                maintenance = annualProfit * maintenanceUnit / 100 * 12;
                totalMaintenance += maintenance;
                insuranceFee = annualProfit * insuranceRate / 100 * 12;
                totalInsuranceFee += insuranceFee;
                leftBalance = loan;
                interest = loan * profit / 100;
                totalInterest += interest;
                netIncome = annualProfit - maintenance - interest;
                totalNetIncome += netIncome;
                profitRate = netIncome / totalInvestment * 100;
                console.log("1 =" + netIncome);
                console.log("2 =" + totalInvestment);
                $("#calculateCostTable").append("<tr>" +
                    "<th rowspan='2'>" + (i + 1) + "</th>" +
                    "<td rowspan='2'>" + numberWithCommas(annualPower) + "</td>" +
                    "<td>" + numberWithCommas(smp) + "</td>" +
                    "<td rowspan='2'>" + numberWithCommas(annualProfit) + "</td>" +
                    "<td rowspan='2'>" + numberWithCommas(maintenance) + "</td>" +
                    "<td rowspan='2'>" + numberWithCommas(insuranceFee) + "</td>" +
                    "<td rowspan='2'></td>" +
                    "<td rowspan='2'>" + numberWithCommas(interest) + "</td>" +
                    "<td rowspan='2'>" + numberWithCommas(leftBalance) + "</td>" +
                    "<td rowspan='2'>" + numberWithCommas(netIncome) + "</td>" +
                    "<td rowspan='2'>" + numberWithCommas(profitRate) + "%</td>" +
                    "</tr>");
                $("#calculateCostTable").append("<tr>" +
                    "<td>" + numberWithCommas(rec) + "</td>" +
                    "</tr>");
                barDataset[i] = Math.round(netIncome); //순수익
                lineDataset[i] = Math.round(annualProfit); //연수익
            } else {
                annualPower = annualPower * 0.995;
                totalAnnualPower += annualPower;
                smpUnit = smpUnit + (smpUnit * replaceAllComma($('#smpRate').val()) / 100);
                smp = annualPower * smpUnit;
                rec = recUnit * weight * annualPower;
                annualProfit = smp + rec;
                totalAnnualProfit += annualProfit;
                maintenance = annualProfit * maintenanceUnit / 100 * 12;
                totalMaintenance += maintenance;
                insuranceFee = annualProfit * insuranceRate / 100 * 12;
                totalInsuranceFee += insuranceFee;
                payback = checkNumber(loan / repayPeriod);
                repayPeriod--;
                loan -= payback;
                leftBalance -= payback;
                interest = checkNumber((leftBalance + payback) * profit / 100);
                totalInterest += interest;
                if (interest > 0) interestCount++;
                netIncome = annualProfit - maintenance - payback - interest;
                totalNetIncome += netIncome;
                profitRate = netIncome / totalInvestment * 100;
                $("#calculateCostTable").append("<tr>" +
                    "<th rowspan='2'>" + (i + 1) + "</th>" +
                    "<td rowspan='2'>" + numberWithCommas(annualPower) + "</td>" +
                    "<td>" + numberWithCommas(smp) + "</td>" +
                    "<td rowspan='2'>" + numberWithCommas(annualProfit) + "</td>" +
                    "<td rowspan='2'>" + numberWithCommas(maintenance) + "</td>" +
                    "<td rowspan='2'>" + numberWithCommas(insuranceFee) + "</td>" +
                    "<td rowspan='2'>" + numberWithCommas(payback) + "</td>" +
                    "<td rowspan='2'>" + numberWithCommas(interest) + "</td>" +
                    "<td rowspan='2'>" + numberWithCommas(leftBalance) + "</td>" +
                    "<td rowspan='2'>" + numberWithCommas(netIncome) + "</td>" +
                    "<td rowspan='2'>" + numberWithCommas(profitRate) + "%</td>" +
                    "</tr>");
                $("#calculateCostTable").append("<tr>" +
                    "<td>" + numberWithCommas(rec) + "</td>" +
                    "</tr>");
                barDataset[i] = Math.round(netIncome);
                lineDataset[i] = Math.round(annualProfit);
            }
        }
        $("#calculateCostTable").append("<tr class='tHead'>" +
            "<th>연평균</th>" +
            "<td>" + numberWithCommas(totalAnnualPower / duration) + "</td>" +
            "<td>" + numberWithCommas(totalAnnualProfit / duration) + "</td>" +
            "<td>" + numberWithCommas(totalAnnualProfit / duration) + "</td>" +
            "<td>" + numberWithCommas(totalMaintenance / duration) + "</td>" +
            "<td>" + numberWithCommas(totalInsuranceFee / duration) + "</td>" +
            "<td>" + numberWithCommas(totalPayback / repayPeriod2) + "</td>" +
            "<td>" + numberWithCommas(totalInterest / interestCount) + "</td>" +
            "<td></td>" +
            "<td>" + numberWithCommas(totalNetIncome / duration) + "</td>" +
            "<td>" + numberWithCommas(totalNetIncome / duration / totalInvestment * 100) + "%</td>" +
            "</tr>");
        $("#calculateCostTable").append("<tr class='tHead'>" +
            "<th>누계합계</th>" +
            "<td>" + numberWithCommas(totalAnnualPower) + "</td>" +
            "<td>" + numberWithCommas(totalAnnualProfit) + "</td>" +
            "<td>" + numberWithCommas(totalAnnualProfit) + "</td>" +
            "<td>" + numberWithCommas(totalMaintenance) + "</td>" +
            "<td>" + numberWithCommas(totalInsuranceFee) + "</td>" +
            "<td>" + numberWithCommas(totalPayback) + "</td>" +
            "<td>" + numberWithCommas(totalInterest) + "</td>" +
            "<td></td>" +
            "<td>" + numberWithCommas(totalNetIncome) + "</td>" +
            "<td></td>" +
            "</tr>");

        $("#calculateCostTable").append("<tr><td colspan='11'>&nbsp;</td></tr>");

        $("#calculateCostTable").append("<tr class='tHead'>" +
            "<th>&nbsp;</th>" +
            "<th>매출액</th>" +
            "<th>원금상환</th>" +
            "<th>&nbsp;</th>" +
            "<th>유지보수비</th>" +
            "<th>보험료</th>" +
            "<th>&nbsp;</th>" +
            "<th>이자</th>" +
            "<th>&nbsp;</th>" +
            "<th>순수익</th>" +
            "<th>수익율</th>" +
            "</tr>");
        $("#calculateCostTable").append("<tr>" +
            "<th>1달</th>" +
            "<td>" + numberWithCommas(totalAnnualProfit / duration / 12) + "</td>" +
            "<td>" + numberWithCommas(totalPayback / duration / 12) + "</td>" +
            "<td></td>" +
            "<td>" + numberWithCommas(totalMaintenance / duration / 12) + "</td>" +
            "<td>" + numberWithCommas(totalInsuranceFee / duration / 12) + "</td>" +
            "<td></td>" +
            "<td>" + numberWithCommas(totalInterest / duration / 12) + "</td>" +
            "<td></td>" +
            "<td>" + numberWithCommas(totalNetIncome / duration / 12) + "</td>" +
            "<td rowspan='3'>" + numberWithCommas(totalNetIncome / duration / totalInvestment * 100) + "%</td>" +
            "</tr>");
        $('#netIncomeMonthDisplay').val(numberWithCommas(Math.floor(totalNetIncome / duration / 12 / 1000) * 1000));
        $('#netIncomeRaiteDisplay').val(numberWithCommas(totalNetIncome / duration / totalInvestment * 100));
        $("#calculateCostTable").append("<tr>" +
            "<th>1년</th>" +
            "<td>" + numberWithCommas(totalAnnualProfit / duration) + "</td>" +
            "<td>" + numberWithCommas(totalPayback / duration) + "</td>" +
            "<td></td>" +
            "<td>" + numberWithCommas(totalMaintenance / duration) + "</td>" +
            "<td>" + numberWithCommas(totalInsuranceFee / duration) + "</td>" +
            "<td></td>" +
            "<td>" + numberWithCommas(totalInterest / duration) + "</td>" +
            "<td></td>" +
            "<td>" + numberWithCommas(totalNetIncome / duration) + "</td>" +
            "</tr>");
        $('#netIncomeYearDisplay').val(numberWithCommas(Math.floor(totalNetIncome / duration / 1000) * 1000));
        $("#calculateCostTable").append("<tr>" +
            "<th>20년</th>" +
            "<td>" + numberWithCommas(totalAnnualProfit) + "</td>" +
            "<td>" + numberWithCommas(totalPayback) + "</td>" +
            "<td></td>" +
            "<td>" + numberWithCommas(totalMaintenance) + "</td>" +
            "<td>" + numberWithCommas(totalInsuranceFee) + "</td>" +
            "<td></td>" +
            "<td>" + numberWithCommas(totalInterest) + "</td>" +
            "<td></td>" +
            "<td>" + numberWithCommas(totalNetIncome) + "</td>" +
            "</tr>");
    }

    function replaceAllComma(value) {
        return value.split(',').join('');
    }

    // 천단위 콤마(,) 표시 및 소숫점 이하 반올림 처리
    function numberWithCommas(cellValue) {
        if (cellValue == null || cellValue === '' || cellValue === 'undefined') return 0;
        return Math.round(cellValue).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    // Value가 0 이하일 경우 0으로 처리
    function checkNumber(value) {
        if (isNaN(value)) return 0; else return value;
    }

    function calculationBasis(type) {
        $('#calculateCostTable').toggle();
    }

    // 그래프
    function drawChart() {
        new Chart($("#myChart"), {
            "type": "bar",
            "data": {
                "labels": labels, // x-axis
                "datasets": [{
                    "label": "순수익",
                    "data": barDataset,
                    "borderColor": "rgb(255, 99, 132)",
                    "backgroundColor": "rgba(255, 99, 132, 0.2)"
                }, {
                    "label": "연수익",
                    "data": lineDataset,
                    "type": "line",
                    "fill": false,
                    "borderColor": "rgb(54, 162, 235)"
                }]
            },
            "options": {
                tooltips: {
                    mode: 'label',
                    callbacks: {
                        label: function (tooltipItem, data) {
                            return tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                        },
                    },
                },
                "scales": {
                    "xAxes": [{
                        scaleLabel: {
                            display: true,
                            labelString: '연차(년)'
                        }
                    }],
                    "yAxes": [{
                        scaleLabel: {
                            display: true,
                            labelString: '매출액(원)'
                        },
                        ticks: {
                            beginAtZero: true,
                            userCallback: function (value, index, values) {
                                value = value.toString();
                                value = value.split(/(?=(?:...)*$)/);
                                value = value.join(',');
                                return value;
                            }
                        }
                    }]
                }
            }
        });
    }

    function calculatePolyAreaMiterPeang (that) {
        $('#polyPathPeang').val('');
        $('#polyPathMiter').val('');

        var value = replaceAllComma($(that).val());
        $('#polyAreaMiter').val((Math.round((value * 1000) / 30.25) / 10).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")); //㎡
        $('#polyAreaMiterPeang').val(value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    }

    function calculatePolyAreaMiter (that) {
        $('#polyPathPeang').val('');
        $('#polyPathMiter').val('');

        var value = replaceAllComma($(that).val());
        $('#polyAreaMiterPeang').val((Math.round((value * 1000) / 30.25) / 10).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")); //㎡
        $('#polyAreaMiter').val(value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    }

    function calculatePolyPathPeang (that) {
        $('#polyAreaMiterPeang').val('');
        $('#polyAreaMiter').val('');

        var value = replaceAllComma($(that).val());
        $('#polyPathMiter').val((Math.round((value * 1000) / 30.25) / 10).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")); //㎡
        $('#polyPathPeang').val(value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    }

    function calculatePolyPathMiter (that) {
        $('#polyAreaMiterPeang').val('');
        $('#polyAreaMiter').val('');

        var value = replaceAllComma($(that).val());
        $('#polyPathPeang').val((Math.round(value * 30.25) / 100).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")); //평
        $('#polyPathMiter').val(value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    }

</script>
</body>
</html>