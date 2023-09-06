/* global resultsContainer, fetch */

let adsData = [];
fetch('GetAdsJsonServlet', {
    method: "POST",
    headers: {
        'Content-Type': 'application/json'
    }
})
.then(response => response.json())
.then(data => {
    adsData = data;
})
.catch(error => console.error('Error fetching data:', error));

const inputElement = document.getElementById('searchInput');
inputElement.addEventListener('keydown', handleSearch);

function handleSearch(event) {
    const searchText = event.target.value.toLowerCase();
        const filteredAds = adsData.filter(ads => {
            return (
                    ads.ad_budget.toString().includes(searchText) ||
                    ads.ad_creation_date.toString().includes(searchText) ||
                    ads.ad_description.toLowerCase().includes(searchText) ||
                    ads.ad_id.toString().includes(searchText) ||
                    ads.ad_title.toLowerCase().includes(searchText) ||
                    ads.ads_image.toLowerCase().includes(searchText)
                    );
        });
    displayResults(filteredAds);
}

function displayResults(ads) {
    resultsContainer.innerHTML = '';
    const loginInfo = sessionStorage.getItem('isLogin1');
    console.log(loginInfo);
    ads.forEach(ads => {
        const adElement = document.createElement('div');
        adElement.classList.add("col-xl-4");
        adElement.classList.add("col-md-6");
        adElement.innerHTML = `<article>
                               <div class="post-img">
                                    <img src="./adsuploads/${ads.ads_image}" alt="" class="img-fluid">
                                </div>
                                <p class="post-category">${ads.ad_title.slice(0,15)}... : ${ads.ad_id}</p>
                                <h2 class="title">
                                    <a onclick="showLoginFirst(${ads.ad_id})">${ads.ad_description.slice(0,30)}...</a>
                                </h2>
                                <div class="d-flex align-items-center">
                                    <div class="post-meta">
                                        <p class="post-date">
                                            <time datetime="2022-01-01">${ads.ad_creation_date}</time>
                                        </p>
                                    </div>
                                </div>
                            </article>`;
        resultsContainer.appendChild(adElement);
    });
}

function showLoginFirst(id){
    Swal.fire({
        icon : 'warning',
        title : 'Login to view all details',
        timer : 3000
    }).then(result => {
        window.location.href = "ads-details.jsp?adsid="+id;
    })
}