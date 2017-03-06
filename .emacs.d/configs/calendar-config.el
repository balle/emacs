(install-missing-packages '(calfw))

; calendar
(require 'calfw-cal)
(require 'calfw-ical)
(require 'calfw-org)
(defun my-open-calendar ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    (cfw:org-create-source "Green")  ; orgmode source
    (cfw:cal-create-source "Orange") ; diary source
    )))

; calendar / diary settings
(setq diary-file "~/organize/termine")
;(setq view-diary-entries-initially nil)
(setq calendar-week-start-day 1)
(setq mark-diary-entries-in-calendar t)
(setq diary-entry-marker (quote diary-face))
(setq european-calendar-style 't)
(setq calendar-latitude 48.00)
(setq calendar-longitude 7.51)
(setq european-calendar-style t)
(setq calendar-location-name "Freiburg, Germany")
(setq calendar-time-zone 60)
(setq calendar-standard-time-zone-name "GMT+1")
(setq calendar-daylight-time-zone-name "GDT")
(setq calendar-christian-all-holidays-flag t)
(setq calendar-mark-holidays-flag t)
(setq calendar-time-display-form
      '(24-hours ":" minutes (and time-zone (concat " (" time-zone ")"))))
(setq calendar-day-name-array
      ["Sonntag" "Montag" "Dienstag" "Mittwoch"
       "Donnerstag" "Freitag" "Samstag"])

(setq calendar-month-name-array
      ["Januar" "Februar" "Maerz" "April" "Mai" "Juni"
       "Juli" "August" "September" "Oktober" "November" "Dezember"])

(setq solar-n-hemi-seasons
      '("Fruehlingsanfang" "Sommeranfang" "Herbstanfang" "Winteranfang"))

(setq general-holidays
      '((holiday-fixed 1 1 "Neujahr")
        (holiday-fixed 5 1 "1. Mai")
        (holiday-fixed 10 3 "Tag der Deutschen Einheit")))

(require 'holidays)
(setq christian-holidays
      '(
        (holiday-float 12 0 -4 "1. Advent" 24)
        (holiday-float 12 0 -3 "2. Advent" 24)
        (holiday-float 12 0 -2 "3. Advent" 24)
        (holiday-float 12 0 -1 "4. Advent" 24)
        (holiday-fixed 12 25 "1. Weihnachtstag")
        (holiday-fixed 12 26 "2. Weihnachtstag")
        (holiday-fixed 1 6 "Heilige Drei Knige")
        ;; Date of Easter calculation taken from holidays.el.
        (let* ((century (1+ (/ displayed-year 100)))
               (shifted-epact (% (+ 14 (* 11 (% displayed-year 19))
                                    (- (/ (* 3 century) 4))
                                    (/ (+ 5 (* 8 century)) 25)
                                    (* 30 century))
                                 30))
               (adjusted-epact (if (or (= shifted-epact 0)
                                       (and (= shifted-epact 1)
                                            (< 10 (% displayed-year 19))))
                                   (1+ shifted-epact)
                                 shifted-epact))
               (paschal-moon (- (calendar-absolute-from-gregorian
                                 (list 4 19 displayed-year))
                                adjusted-epact))
               (easter (calendar-dayname-on-or-before 0 (+ paschal-moon 7))))
          (holiday-filter-visible-calendar
           (mapcar
            (lambda (l)
              (list (calendar-gregorian-from-absolute (+ easter (car l)))
                    (nth 1 l)))
            '(
              (-48 "Rosenmontag")
              ( -2 "Karfreitag")
              (  0 "Ostersonntag")
              ( +1 "Ostermontag")
              (+39 "Christi Himmelfahrt")
              (+49 "Pfingstsonntag")
              (+50 "Pfingstmontag")
              (+60 "Fronleichnam")
              ))))
        (holiday-fixed 8 15 "Mari Himmelfahrt")
        (holiday-fixed 11 1 "Allerheiligen")
        (holiday-float 11 3 1 "Bu- und Bettag" 16)
        (holiday-float 11 0 1 "Totensonntag" 20)))

(setq calendar-holidays
      (append general-holidays christian-holidays))
