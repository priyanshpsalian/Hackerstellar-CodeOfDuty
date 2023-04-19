// const request = require("request");

// const options = {
//   method: "POST",
//   url: "https://stock-market-news.p.rapidapi.com/public/actions",
//   headers: {
//     "content-type": "application/json",
//     Authorization:
//       "34fa2e3fa6e648d58781b6047a5939c1afe0bd1dae6f4a91a91daf93a25e8f0d",
//     "X-RapidAPI-Key": "27a69cf21amsh325a8ba16cf714bp155393jsn0ee108a31352",
//     "X-RapidAPI-Host": "stock-market-news.p.rapidapi.com",
//     useQueryString: true,
//   },
//   body: {
//     type: "filterArticles",
//     queryString:
//       '(title:"merger" OR description:"merger" OR title:acquisition) AND source.id:(-"sec-api")',
//     from: 0,
//     size: 10,
//   },
//   json: true,
// };
// request(options, function (error, response, body) {
//   if (error) throw new Error(error);

//   console.log(body);
// });

const body = {
  total: {
    value: 10000,
    relation: "gte",
  },
  from: 0,
  size: 10,
  sort: [
    {
      publishedAt: {
        order: "desc",
      },
    },
  ],
  articles: [
    {
      source: {
        id: "businesswire",
        name: "BusinessWire",
      },
      categories: [],
      symbols: [],
      markets: [],
      title:
        "LEAF Communications Announces Strategic Acquisition of CelTeq-HPC to Support Growing Demand in the East",
      content: "",
      description:
        "Leading Telecom Solutions Provider Moves East to Support Recently Executed Contracts and Fuel Continued Growth LEAF Communications, a proven telecom leader serving Fortune 500 clients across the U.S. with a full portfolio of cutting-edge wireless sol",
      url: "https://newsfilter.io/articles/leaf-communications-announces-strategic-acquisition-of-celteq-hpc-to-support-growing-demand-in-the-e-f72a8908e70b7950aa74476d09f9b19b",
      imageUrl: "",
      publishedAt: "2021-06-14T17:18:00Z",
      id: "f72a8908e70b7950aa74476d09f9b19b",
      industries: [],
      sectors: [],
    },
    {
      source: {
        id: "benzinga",
        name: "Benzinga",
      },
      categories: [],
      symbols: ["AVCO"],
      markets: [],
      title:
        "Avalon GloboCare Adds Cell Therapy-Based Candidates For Cancer With SenlangBio Acquisition: Highlights",
      content: "",
      description:
        "Avalon GloboCare Corp (NASDAQ: AVCO) has agreed to acquire Hebei Senlang Biotechnology, dubbed SenlangBio, a China-based cell therapy company, in an all-stock transaction. In connection with the transaction, Avalon will issue 81 million shares of its common stock. The acquisition...",
      url: "https://newsfilter.io/articles/avalon-globocare-adds-cell-therapy-based-candidates-for-cancer-with-senlangbio-acquisition-highlight-a5b65dc07883a7546c8ef36af8502140",
      imageUrl: "",
      publishedAt: "2021-06-14T12:49:00-04:00",
      id: "a5b65dc07883a7546c8ef36af8502140",
      industries: ["Medical Care"],
      sectors: ["Healthcare"],
    },
    {
      source: {
        id: "prNewswire",
        name: "PR Newswire",
      },
      categories: [],
      symbols: ["NMRK"],
      markets: [],
      title:
        "Newmark Arranges Acquisition and Construction Loan for 111 Wall Street on Behalf of Nightingale Properties and Wafra Capital Partners",
      content: "",
      description:
        'NEW YORK, June 14, 2021 /PRNewswire/ -- Newmark¹ announces that it has closed an acquisition and construction loan for 111 Wall Street, New York, on behalf of Nightingale Properties ("Nightingale") and Wafra Capital Partners ("WCP"). The frequent inst',
      url: "https://newsfilter.io/articles/newmark-arranges-acquisition-and-construction-loan-for-111-wall-street-on-behalf-of-nightingale-prop-d7f185cfe08064764f149b45c6e92379",
      imageUrl: "",
      publishedAt: "2021-06-14T15:47:00Z",
      id: "d7f185cfe08064764f149b45c6e92379",
      industries: ["Real Estate Services"],
      sectors: ["Real Estate"],
    },
    {
      source: {
        id: "seekingAlpha",
        name: "Seeking Alpha",
      },
      categories: [],
      symbols: ["ICLR", "PRAH"],
      markets: [],
      title:
        "ICON's Indigo Merger Sub to raise $2.515B through private debt offering",
      content: "",
      description:
        "In connection with the proposed acquisition by ICON (ICLR -0.5%) of PRA Health Sciences (NASDAQ:PRAH) pursuant to which Indigo Merger Sub, Inc., a wholly owned subsidiary will merge with and into PRA, with PRA surviving the Merger, that Merger Sub intends to offer $500M of senior secured notes due 2026 and $1.515B of senior secured notes due 2028 in a private offering. ICON intends to use the proceeds together with cash on hand and borrowings made under a proposed new credit facilities to fund the cash consideration payable by ICON for the Merger, refinance and repay certain existing indebtedness of ICON, its subsidiaries and PRA.In February 2021, the company announced to acquire PRA Health in a cash and stock deal valued at $12B.",
      url: "https://newsfilter.io/articles/icons-indigo-merger-sub-to-raise-2515b-through-private-debt-offering-4a0fd5cbf5cac47a180dbbbc1b894469",
      imageUrl: "",
      publishedAt: "2021-06-14T11:45:00-04:00",
      id: "4a0fd5cbf5cac47a180dbbbc1b894469",
      industries: ["Diagnostics & Research"],
      sectors: ["Healthcare"],
    },
    {
      source: {
        id: "prNewswire",
        name: "PR Newswire",
      },
      categories: [],
      symbols: [],
      markets: [],
      title:
        "MRO Announces Acquisition of Clinical Data Interoperability Company FIGmd",
      content: "",
      description:
        "NORRISTOWN, Pa., June 14, 2021 /PRNewswire/ -- MRO, Corp. (MRO), a leading clinical data workflow platform and the KLAS-rated No. 1 provider of release of information (ROI) solutions, announced today the acquisition of Rockford, IL-based FIGmd, a lead",
      url: "https://newsfilter.io/articles/mro-announces-acquisition-of-clinical-data-interoperability-company-figmd-9464b9a7837cd3298d2f8fd9288ab94b",
      imageUrl: "",
      publishedAt: "2021-06-14T14:00:00Z",
      id: "9464b9a7837cd3298d2f8fd9288ab94b",
      industries: [],
      sectors: [],
    },
    {
      source: {
        id: "globenewswire",
        name: "GlobeNewswire",
      },
      categories: [],
      symbols: ["TWND"],
      markets: [],
      title: "QOMPLX Announces Distinguished Post-Merger Board of Directors",
      content: "",
      description:
        'TYSONS, Va., June 14, 2021 (GLOBE NEWSWIRE) -- QOMPLX, Inc. ("QOMPLX"), a global leader in cybersecurity and risk analytics, announced today an accomplished slate composed of industry-leading executives for its post-merger Board of Directors upon compl',
      url: "https://newsfilter.io/articles/qomplx-announces-distinguished-post-merger-board-of-directors-b02119b434efd5ac9989540d81bdbca9",
      imageUrl: "",
      publishedAt: "2021-06-14T13:43:40Z",
      id: "b02119b434efd5ac9989540d81bdbca9",
      industries: [],
      sectors: [],
    },
    {
      source: {
        id: "accesswire",
        name: "AccessWire",
      },
      categories: [],
      symbols: ["CIDM"],
      markets: [],
      title:
        "Cinedigm Finalizes Acquisition of Advanced Streaming Technology Platform FoundationTV; Forms Cinedigm India",
      content: "",
      description:
        "Newest Division of Cinedigm will Develop Streaming Services for Booming Indian & South Asian Markets in Addition to Powering Cinedigm's Global Portfolio of Streaming Services LOS ANGELES, CA / ACCESSWIRE / June 14, 2021 / Cinedigm (NASDAQ:CIDM), the lea",
      url: "https://newsfilter.io/articles/cinedigm-finalizes-acquisition-of-advanced-streaming-technology-platform-foundationtv-forms-cinedigm-5184af22a1d120f9bddb24f62f16189f",
      imageUrl: "",
      publishedAt: "2021-06-14T13:30:00Z",
      id: "5184af22a1d120f9bddb24f62f16189f",
      industries: ["Media - Diversified"],
      sectors: ["Consumer Cyclical"],
    },
    {
      source: {
        id: "globenewswire",
        name: "GlobeNewswire",
      },
      categories: [],
      symbols: ["AVCO"],
      markets: [],
      title:
        "Avalon GloboCare Announces Execution of Purchase Agreement for Acquisition of SenlangBio in All Stock Transaction",
      content: "",
      description:
        'SenlangBio, a world-class cell therapy company, has developed a robust pipeline which includes 15 autologous and universal ("off-the-shelf") CAR-T and CAR-γδT cell therapy candidates targeting hematologic malignancies and solid tumors SenlangBio\'s l',
      url: "https://newsfilter.io/articles/avalon-globocare-announces-execution-of-purchase-agreement-for-acquisition-of-senlangbio-in-all-stoc-9ad894379ad29da5b304c9591e579364",
      imageUrl: "",
      publishedAt: "2021-06-14T13:00:00Z",
      id: "9ad894379ad29da5b304c9591e579364",
      industries: ["Medical Care"],
      sectors: ["Healthcare"],
    },
    {
      source: {
        id: "businesswire",
        name: "BusinessWire",
      },
      categories: [],
      symbols: ["GHC", "LEAF"],
      markets: [],
      title: "Graham Holdings Completes Acquisition of Leaf Group Ltd.",
      content: "",
      description:
        "Graham Holdings Company (NYSE:GHC) reported today that it has closed on the previously announced acquisition of Leaf Group Ltd. (NYSE:LEAF) for $8.50 per share in an all cash transaction valued at approximately $323 million. Headquartered in Santa Mo",
      url: "https://newsfilter.io/articles/graham-holdings-completes-acquisition-of-leaf-group-ltd-1825dfaaee72a748e72566e5ddd655de",
      imageUrl: "",
      publishedAt: "2021-06-14T13:00:00Z",
      id: "1825dfaaee72a748e72566e5ddd655de",
      industries: [
        "Education & Training Services",
        "Internet Content & Information",
      ],
      sectors: ["Consumer Defensive", "Technology"],
    },
    {
      source: {
        id: "seekingAlpha",
        name: "Seeking Alpha",
      },
      categories: [],
      symbols: ["HGV"],
      markets: [],
      title: "Hilton Grand Vacations to raise $425M through debt offering",
      content: "",
      description:
        "Hilton Grand Vacations (NYSE:HGV) to offer $425M of new senior unsecured notes due 2031 in a private offering, issued by its wholly-owned subsidiaries, Hilton Grand Vacations Borrower Escrow LLC and Hilton Grand Vacations Borrower Escrow Inc. Upon the closing of the Dakota Holding merger and release of the proceeds of the offering from the escrow account, HGV intends to use the proceeds to finance the repayment of certain indebtedness in connection with the Merger.Last month, the company raised $850M by issuing 5.000% senior unsecured notes due June 1, 2029.Shares down 0.4% premarket.",
      url: "https://newsfilter.io/articles/hilton-grand-vacations-to-raise-425m-through-debt-offering-6a24dd3880988de1c7474239bccbd1bf",
      imageUrl: "",
      publishedAt: "2021-06-14T08:58:00-04:00",
      id: "6a24dd3880988de1c7474239bccbd1bf",
      industries: ["Resorts & Casinos"],
      sectors: ["Consumer Cyclical"],
    },
  ],
};
// console.log(body.articles);
const filteredData = body.articles.map((item) => {
  const title = item.title;
  const url = item.url;
  const message = `*${title}*\n${url}`;
  return message;
});

console.log(filteredData);
