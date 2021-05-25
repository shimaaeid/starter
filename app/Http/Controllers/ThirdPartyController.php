<?php

namespace App\Http\Controllers;


use App\Services\CovidStatisticService;
use Carbon\Carbon;

class ThirdPartyController extends Controller
{
    public function index(CovidStatisticService $covidStatisticService)
    {
        $today = Carbon::now()->toDateString();

        $confirmedCovidCasesUntilToday = $covidStatisticService->getTotalCasesByCountryAndType('macedonia', 'confirmed');
        $recoveredCovidCasesUntilToday = $covidStatisticService->getTotalCasesByCountryAndType('macedonia', 'recovered');
        $deadCovidCasesUntilToday = $covidStatisticService->getTotalCasesByCountryAndType('macedonia', 'deaths');

        return view('index', [
            'today' => $today,
            'confirmedCovidCasesUntilToday' => $confirmedCovidCasesUntilToday,
            'recoveredCovidCasesUntilToday' => $recoveredCovidCasesUntilToday,
            'deadCovidCasesUntilToday' => $deadCovidCasesUntilToday,
        ]);
    }

    public function getCities()
    {
        $today = Carbon::now()->toDateString();

        $httpClient = new \GuzzleHttp\Client();
        $request =
            $httpClient
            ->get("https://www.maysanexpress.sa/api/cities?api_key=1b0qQKnrpJg49aboWOkOKvr8deKUfN5r");

        $response = json_decode($request->getBody()->getContents());
        //return  $response;

        return view('welcome',compact('response'));
    }
}
