#!/bin/bash

#--- FUNCTION DEFINITIONS ---

# Define color codes
RESET='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

banner() {

# Clear the screen
clear

# Display colorful ASCII art
echo -e "${GREEN}
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀
⠀⠀⠀⣀⣀⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀
⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀
⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀
⠀⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀
⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⣿⣿⣿⣿⡿⠛⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀
${RESET}"
echo -e "${YELLOW}Welcome DZ LAB AUTO RECON AND FUZZ ! ${RESET}"
echo -e "${BLUE}Enjoy your day !${RESET}"
sleep 3
# Add more colorful text or ASCII art here if necessary
}

alert() {

	
# Display an alert box using dialog
dialog --title "Alert" --msgbox "DZ RECON AND FUZZ AUTOMATION !" 10 50

# Clear the dialog
clear


}

# Function to display a progress bar
progress_bar() {
    local duration=${1}  # Duration for the progress in seconds
    local bar_length=50  # Length of the progress bar
    local color_normal="\e[0m"
    local color_red="\e[31m"
    local color_yellow="\e[33m"
    local color_green="\e[32m"

    # Loop through the duration
    for ((i=0; i<=duration; i++)); do
        sleep 1  # Simulate work by sleeping for 1 second

        # Calculate the percentage completion
        percent=$((i * 100 / duration))
        # Calculate the number of completed bars
        completed=$((i * bar_length / duration))
        # Create the bar string
        bar=$(printf "%-${bar_length}s" "#" | tr " " "#")
        # Color the completed portion
        progress=$(printf "%${completed}s" "" | tr " " "#")
        remaining=$((bar_length - completed))

        # Set the color based on the percentage
        if ((percent < 50)); then
            color=$color_red
        elif ((percent < 80)); then
            color=$color_yellow
        else
            color=$color_green
        fi

        # Print the progress bar
        printf "\r[${color}${progress}${color_normal}$(printf "%${remaining}s" "")] ${percent}%%"
    done

    echo -e "\nDone!"
}


# Function to send HTTP GET request
send_http() {
    local url="$1"
    local response

    # Array of user agents
    local user_agents=(
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0"
        "Mozilla/5.0 (Linux; Android 8.0.0; Nexus 5X Build/OPR6.170623.013) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36"
        "Mozilla/5.0 (iPhone; CPU iPhone OS 10_0 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) Version/10.0 Mobile/14E5239e Safari/602.1"
        "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
    )

    # Select a random user agent
    local random_user_agent=${user_agents[$RANDOM % ${#user_agents[@]}]}

    # Make the HTTP request with the random user agent
    response=$(curl -s -A "$random_user_agent" "$url" | tr -d '\0')

    # Log some properties of the response for debugging
    echo "Response length: ${#response} characters"
    [ -z "$response" ] && echo "Warning: No response received from $url" 

    # Remove null bytes
    echo "$response" | tr -d '\0'
}

# Function to collect all parameter names from a text file
collect_parameters() {
    local file="$1"
    xargs -n1 echo < "$file"
}

# Function to parse all URLs from a list
parse_urls() {
    local file="$1"
    grep -o 'http[s]\?://[^ "]\+' "$file"
}



function extract_js() {
    local input="$1"

    # Check if input is a URL
    if [[ "$input" =~ ^https?:// ]]; then
        # Fetch the content of the URL
        html_content=$(curl -s "$input" | tr -d '\0')
    else
        # Assume input is a file
        html_content=$(<"$input")
    fi

    # Extract all JS <script> tags and get the src attributes
    js_links=$(echo "$html_content" | grep -oP '<script\s+[^>]*src="\K[^"]+')

    # Iterate over each JS link
    for js_link in $js_links; do
        # Check if the link is relative and make it absolute if necessary
        if [[ "$js_link" != http* ]]; then
            # Determine base URL if input was a URL
            if [[ "$input" =~ ^https?:// ]]; then
                base_url=$(dirname "$input")
                js_link="${base_url}/${js_link}"
            fi
        fi

        echo "Fetching: $js_link"

        # Fetch and print the content of the JS file
        js_content=$(curl -s "$js_link" | tr -d '\0')
        echo "$js_content"
        echo -e "\n\n"  # Print extra newlines for readability
    done
}



# Function to crawl a URL up to a specified depth
crawl() {
    local url="$1"
    local depth="$2"
    
    if [[ $depth -le 0 ]]; then
        return
    fi
    
    echo "Crawling: $url"

    # Fetch the page and extract URLs
    local page_content
    page_content=$(send_http "$url" | tr -d '\0')

    
    urlget=url
    # base_url=$(get_base_url "$url")
    page_content=$(curl -s "$urlget" | tr -d '\0')
    extract_js "$url"


    # Save to a temporary HTML file (optional)
    echo "$page_content" > temp.html
    
    # Extract links from the page and crawl them
    echo "$page_content" | grep -o 'http[s]\?://[^ "]\+' | while read -r new_url; do
        crawl "$new_url" $((depth - 1))
    done
}

# Function to collect input forms' names and IDs from HTML
collect_inputs() {
    local file="$1"
    grep -o '<input[^>]*>' "$file" | \
    sed -n 's/.*name="\([^"]*\)".*/\1/p' | sort -u
}

# Function to inject parameters into URLs
inject_parameters() {
    local url="$1"
    shift
    local params=("$@")

    for param in "${params[@]}"; do
        echo "${url}?$param=${RANDOM}"  # Using RANDOM as a placeholder for injection
    done
}

# Function to save crawled URLs to a file
save_crawled_urls() {
    local url="$1"
    local file="$2"
    echo "$url" >> "$file"
}

# Function to check HTTP status code
check_status_code() {
    local url="$1"
    local status_code
    status_code=$(curl -o /dev/null -w "%{http_code}" -s "$url" | tr -d '\0')
    echo "Status for $url: $status_code"
}

# Function to retrieve and print the page title
get_page_title() {
    local url="$1"
    local title
    title=$(send_http "$url" | grep -o '<title>[^<]*' | sed 's/<title>//')
    echo "Title for $url: $title"
}

# Function to extract and save all links to a file
save_links() {
    local url="$1"
    local output_file="$2"
    send_http "$url" | grep -o 'http[s]\?://[^ "]\+' >> "$output_file"
}

# Function to extract all forms from a page
extract_forms() {
    local url="$1"
    send_http "$url" | grep -o '<form[^>]*>' | sort -u
}

# Function to perform a recursive find on the forms and the parameters
recursive_form_filling() {
    local url="$1"
    local params=("$@")
    echo "Recursively filling forms on: $url"
    
    for param in "${params[@]}"; do
        response=$(curl -s -G --data-urlencode "$param=${RANDOM}" "$url" | tr -d '\0')
        echo "Response for $param: $(echo "$response" | grep -o 'error\|success')"
    done
}

# Function to log activities to a file
log_activity() {
    local message="$1"
    local log_file="$2"
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $message" >> "$log_file"
}

# Function to parse and print all cookies from a URL
print_cookies() {
    local url="$1"
    curl -s -c cookies.txt "$url" | tr -d '\0' > /dev/null
    echo "Cookies for $url:"
    cat cookies.txt
}

# Function to download a page content to a specified file
download_page() {
    local url="$1"
    local output_file="$2"
    curl -s "$url" -o "$output_file" | tr -d '\0'
    echo "Downloaded: $url to $output_file"
}

# Function to extract subdomains from HTTP response

extract_subdomains() {
    # URL to fetch
    local url="$1"
    
    # Use curl to get the HTTP response
    response=$(curl -s "$url" | tr -d '\0')

    # Use grep or awk to extract potential subdomains from the response
    # This example assumes subdomains are in the format example.com, www.example.com, sub.example.com
    echo "$response" | grep -oP '(?<=://|\.)([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}' | sort -u
}


# Function to extract all links from a given URL and retrieve DNS information
extract_links_and_dns() {
    local input_url="$1"

    # Step 1: Extract links from the input URL
    echo "Extracting links from $input_url..."
    #local links=$(curl -s "$input_url" | grep -oP 'href="\K(https?://[^"]+|/[^"]+)' | sed "s|^|$input_url|" | sort -u)
    local links=$(curl -s "$input_url" | grep -oP 'href="\K(https?://[^"]+|/[^"]+)' | sort -u)

    # Step 2: Loop through each link to get DNS information from HTTP response
    for link in $links; do
        # Check if the link is a relative URL
        if [[ $link != http* ]]; then
            # If it's a relative URL, form the complete URL
            link="${input_url%/*}/$link"
        fi
        # Print the link being processed
        echo "Checking link: $link"

        # Get the hostname from the link
        host=$(echo "$link" | awk -F/ '{print $3}')

        # Get DNS info using dig
        dns_info=$(dig +short "$host")

        # Get HTTP response information using curl
        curl_output=$(curl -s -o /dev/null -w "%{http_code} %{url_effective}\t\t\n" "$link")

        # Extract and print the DNS info
        if [[ -n "$dns_info" ]]; then
            echo "DNS for $host: $dns_info"
        else
            echo "No DNS info for $host"
        fi

        # Print the HTTP response
        echo "Response: $curl_output"
    done
}

extract_csp_domains_links() {
    local url="$1"

    # Fetch headers and extract Content-Security-Policy
    curl -s -D - "$url" -o /dev/null | \
    grep -i 'content-security-policy' | \
    sed -E 's/.*content-security-policy: //I; s/[;].*//; s/\s*,\s*/,/g' | \
    tr ',' '\n' | \
    sed 's/^\s*//;s/\s*$//;s/^.*\/\/\(.*\)$/\1/g' | \
    awk -F '.' '{
        # Collect domains and subdomains
        if ($0 ~ /^https?:\/\//) {
            # Print full URLs
            print $0;
        } else {
            # Count the parts of the domain
            n = split($0, domainParts, ".");
            if (n >= 2) {
                # Print subdomains if they exist
                if (n > 2) {
                    for (i = 1; i <= n - 2; i++) {
                        print domainParts[i] "." domainParts[i+1] "." domainParts[i+2];
                    }
                }
                # Print the main domain
                print domainParts[n-1] "." domainParts[n];
            }
        }
    }' | sort -u | awk 'NF'
}

# Function to manage worker jobs
manage_jobs() {
    local urls=("$@")
    local max_jobs=5
    local job_count=0
    local idx=0

    while [ $idx -lt ${#urls[@]} ]; do
        # If we have room for more jobs, start a new one
        if [[ $job_count -lt $max_jobs ]]; then
            process_url "${urls[$idx]}" &
            job_count=$((job_count + 1))
            idx=$((idx + 1))
	    pid=$!  # Get the PID of the last background process
            spin "$pid" &  # Start spinner in the background

        else
            # Wait for a job to finish
            wait -n
            job_count=$((job_count - 1))  # Decrement active job count
        fi
    done

    # Wait for all remaining jobs to finish
    wait
}

# Function to display a spinner while a job is running
spin() {
    local pid=$1
    local delay=0.1
    local spinchars='|/-\'
    local i=0

    while kill -0 $pid 2>/dev/null; do
        local temp="${spinchars:i++%${#spinchars}:1}"
        echo -ne "\r[dz injector ] $temp "  # Print spinner
        sleep $delay
    done
    echo -ne "\r"  # Clear the line
}

# Function to process a URL (can be customized with more logic)
process_url() {
    local url="$1"
    log_activity "Processing URL: $url" "activity.log"
    crawl "$url" 5  # Specify depth here if needed
    save_crawled_urls "$url" "crawled_urls.txt"
    check_status_code "$url"
    get_page_title "$url"
    save_links "$url" "links.txt"
    extract_forms "$url"
    # Example usage of the extract_subdomains function
    extract_subdomains "$url"
    # Call the function with the URL you want to extract links from
    extract_links_and_dns "$url"
    # Usage example
    extract_csp_domains_links $1
  
    # Example usage 
    csp_header=$(curl -s -I $1 | grep -i 'content-security-policy' | grep -oP '(https?://(www\.)?[^\s]+|ftp://[^\s]+)') 
    # Format the output line by line
    echo "$csp_header" | tr ' ' '\n' 
}

#--- MAIN EXECUTION ---

# Example usage
if [[ -n "$1" ]]; then
    alert
    # Example usage: progress bar for 10 seconds
    progress_bar 10

    banner

    output_file="crawled_urls.txt"
    echo "" > "$output_file"  # Initialize output file

    # Parse URLs from the provided text file
    urls=$(parse_urls "$1")

    # Manage crawling jobs
    manage_jobs "${urls[@]}"
    # Crawl each URL up to a depth of 5
    for url in $urls; do
	# Manage crawling jobs
	spin
        crawl "$url" 5
        save_crawled_urls "$url" "$output_file"
        check_status_code "$url"
        get_page_title "$url"
        save_links "$url" "$output_file"
        extract_forms "$url"
        
        # Log activities
        log_activity "Crawled URL: $url" "activity.log"
        
        # Print cookies
        print_cookies "$url"
        
        # Download page
	# Get the current date and time in the desired format
        timestamp=$(date +"%Y%m%d_%H%M%S")

	# Define the directory name
	DIR="logs"

	# Check if the directory exists
	if [ -d "$DIR" ]; then
    		echo "Directory '$DIR' already exists."
	else
    		# Create the directory
    		mkdir "$DIR"
    		echo "Directory '$DIR' has been created."
	fi
        # Create the filename
        filename="logs/downloaded_content_${timestamp}.html"
	
        download_page "$url" "$filename"
	
	extract_subdomains "$url"

	# Call the function with the URL you want to extract links from
    	extract_links_and_dns "$url" 

	# Usage example
	extract_csp_domains_links $1
  
	# Example usage 
	csp_header=$(curl -s -I $1 | grep -i 'content-security-policy' | grep -oP '(https?://(www\.)?[^\s]+|ftp://[^\s]+)')
	# Format the output line by line
	echo "$csp_header" | tr ' ' '\n' 
 
 		
    done

    # Collect input names from the last crawled URL
    inputs=$(collect_inputs "temp.html")
    
    # Inject parameters into each URL
    for url in $urls; do
        inject_parameters "$url" $inputs
    done
else
    echo "Usage: $0 <url-file>"
    exit 1
fi
