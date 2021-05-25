{{$today}}
<br><br><br>
<h1>confirmed</h1>{{json_encode($confirmedCovidCasesUntilToday->Cases)}} && {{json_encode($confirmedCovidCasesUntilToday->Date)}}
<br><br><br>
<h1>recovered</h1>{{json_encode($recoveredCovidCasesUntilToday->Cases)}} $$ {{json_encode($recoveredCovidCasesUntilToday->Date)}}
<br><br><br>
<h1>dead</h1>{{json_encode($deadCovidCasesUntilToday->Cases)}} && {{json_encode($deadCovidCasesUntilToday->Date)}}
<br><br><br>




